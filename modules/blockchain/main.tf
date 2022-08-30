// Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

provider "oci" {
  tenancy_ocid     = var.oci_provider.tenancy
  user_ocid        = var.oci_provider.user_id
  fingerprint      = var.oci_provider.fingerprint
  private_key_path = var.oci_provider.key_file_path
  region           = data.oci_identity_regions.existing.regions[0].name
  alias            = "home"
}

data "oci_identity_tenancy" "existing" {
  tenancy_id = var.oci_provider.tenancy
}

data "oci_identity_regions" "existing" {
  filter {
    name   = "key"
    values = [data.oci_identity_tenancy.existing.home_region_key]
  }
}

resource "oci_blockchain_blockchain_platform" "this" {
  provider          = oci.home
  for_each          = var.blockchain_params
  compartment_id    = var.compartments[each.value.compartment_name]
  compute_shape     = each.value.compute_shape
  idcs_access_token = each.value.idcs_access_token
  display_name      = each.value.name
  platform_role     = each.value.platform_role
  federated_user_id = var.oci_provider.user_id
}

resource "oci_blockchain_osn" "this" {
  provider               = oci.home
  for_each               = var.osn_params
  ad                     = each.value.ad
  blockchain_platform_id = oci_blockchain_blockchain_platform.this[each.value.platform_name].id

  ocpu_allocation_param {
    ocpu_allocation_number = each.value.ocpu
  }
}

resource "oci_blockchain_peer" "this" {
  provider               = oci.home
  for_each               = var.peer_params
  ad                     = each.value.ad
  blockchain_platform_id = oci_blockchain_blockchain_platform.this[each.value.platform_name].id
  ocpu_allocation_param {
    ocpu_allocation_number = each.value.ocpu
  }
  role  = each.value.role
  alias = each.value.alias
}
