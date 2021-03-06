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

resource "oci_identity_compartment" "this" {
  provider       = oci.home
  for_each       = var.comp_params
  compartment_id = length(each.value.parent_name) > 0 ? var.parent_comp == "" ? var.auth_provider.tenancy : var.parent_comp[each.value.parent_name].id : var.auth_provider.tenancy
  name           = each.value.name
  description    = each.value.description
  enable_delete  = each.value.enable_delete
}

resource "time_sleep" "wait" {
  depends_on      = [oci_identity_compartment.this]
  create_duration = "60s"
}

resource "oci_identity_user" "this" {
  provider       = oci.home
  for_each       = var.user_params
  name           = each.value.name
  compartment_id = var.auth_provider.tenancy
  description    = each.value.description
}

resource "oci_identity_group" "this" {
  provider       = oci.home
  for_each       = var.group_params
  name           = each.value.name
  description    = each.value.description
  compartment_id = var.auth_provider.tenancy
}

resource "oci_identity_user_group_membership" "this" {
  provider = oci.home
  for_each = var.user_params
  user_id  = oci_identity_user.this[each.value.name].id
  group_id = oci_identity_group.this[each.value.group_name].id
}


resource "oci_identity_policy" "this" {
  provider       = oci.home
  depends_on     = [oci_identity_group.this]
  for_each       = var.policy_params
  name           = each.value.name
  description    = each.value.description
  compartment_id = length(each.value.compartment_name) > 0 ? var.parent_comp == "" ? var.auth_provider.tenancy : var.parent_comp[each.value.compartment_name].id : var.auth_provider.tenancy
  statements     = each.value.statements
}
