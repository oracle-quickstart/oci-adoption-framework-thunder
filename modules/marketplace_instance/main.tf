// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_core_app_catalog_listing_resource_version_agreement" "this" {
  for_each                 = var.instance_params
  listing_id               = each.value.listing_id
  listing_resource_version = each.value.listing_resource_version
}

resource "oci_core_app_catalog_subscription" "this" {
  for_each                 = var.instance_params
  compartment_id           = var.compartment_ids[each.value.compartment_name]
  eula_link                = oci_core_app_catalog_listing_resource_version_agreement.this[each.key].eula_link
  listing_id               = oci_core_app_catalog_listing_resource_version_agreement.this[each.key].listing_id
  listing_resource_version = oci_core_app_catalog_listing_resource_version_agreement.this[each.key].listing_resource_version
  oracle_terms_of_use_link = oci_core_app_catalog_listing_resource_version_agreement.this[each.key].oracle_terms_of_use_link
  signature                = oci_core_app_catalog_listing_resource_version_agreement.this[each.key].signature
  time_retrieved           = oci_core_app_catalog_listing_resource_version_agreement.this[each.key].time_retrieved
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ids[var.instance_params[keys(var.instance_params)[0]].compartment_name]
}

resource "oci_core_instance" "this" {
  depends_on                          = [oci_core_app_catalog_subscription.this]
  for_each                            = var.instance_params
  availability_domain                 = data.oci_identity_availability_domains.ads.availability_domains[each.value.ad - 1].name
  compartment_id                      = var.compartment_ids[each.value.compartment_name]
  shape                               = each.value.shape
  display_name                        = each.value.hostname
  preserve_boot_volume                = each.value.preserve_boot_volume
  freeform_tags                       = each.value.freeform_tags
  is_pv_encryption_in_transit_enabled = each.value.encrypt_in_transit
  fault_domain                        = format("FAULT-DOMAIN-%s", each.value.fd)


  create_vnic_details {
    assign_public_ip = each.value.assign_public_ip
    subnet_id        = var.subnet_ids[each.value.subnet_name]
    hostname_label   = each.value.hostname
    nsg_ids          = [for nsg in each.value.nsgs: var.nsgs[nsg]]
  }

  source_details {
    boot_volume_size_in_gbs = each.value.boot_volume_size
    source_type             = "image"
    source_id               = each.value.image_version
    kms_key_id              = length(var.kms_key_ids) == 0 || each.value.kms_key_name == "" ? "" : var.kms_key_ids[each.value.kms_key_name]
  }

  metadata = {
    ssh_authorized_keys = file(each.value.ssh_public_key)
  }
}
