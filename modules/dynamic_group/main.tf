// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

provider "oci" {
  tenancy_ocid     = var.auth_provider.tenancy
  user_ocid        = var.auth_provider.user_id
  fingerprint      = var.auth_provider.fingerprint
  private_key_path = var.auth_provider.key_file_path
  region           = data.oci_identity_regions.existing.regions[0].name
  alias            = "home"
}

data "oci_identity_tenancy" "existing" {
  tenancy_id = var.auth_provider.tenancy
}

data "oci_identity_regions" "existing" {
  filter {
    name   = "key"
    values = [data.oci_identity_tenancy.existing.home_region_key]
  }
}

resource "oci_identity_dynamic_group" "this" {
  for_each       = var.dynamic_groups
  provider       = oci.home
  name           = each.value.name
  compartment_id = var.auth_provider.tenancy
  description    = each.value.description
  matching_rule  = "ALL {resource.type = '${each.value.resource_type}', resource.compartment.id = '${var.matching_compartments[each.value.matching_compartment_name].id}'}"

  #Optional
  # defined_tags = each.defined_tags
  # freeform_tags = each.freeform_tags
}

resource "oci_identity_policy" "this" {
  provider       = oci.home
  depends_on     = [oci_identity_dynamic_group.this]
  for_each       = var.dg_policy_params
  name           = each.value.name
  description    = each.value.description
  compartment_id = var.matching_compartments[each.value.compartment_name].id
  statements     = each.value.statements
}
