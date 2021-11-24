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

data "oci_cloud_guard_detector_recipes" "existing" {
  depends_on     = [oci_cloud_guard_cloud_guard_configuration.this]
  compartment_id = var.compartments["tenancy"]
}

data "oci_cloud_guard_responder_recipes" "existing" {
  depends_on     = [oci_cloud_guard_cloud_guard_configuration.this]
  compartment_id = var.compartments["tenancy"]
}


data "oci_cloud_guard_cloud_guard_configuration" "this" {
  compartment_id = var.compartments["tenancy"]
}





resource "oci_cloud_guard_cloud_guard_configuration" "this" {
  for_each              = data.oci_cloud_guard_cloud_guard_configuration.this == null ? var.cloud_guard_config : {}
  compartment_id        = var.compartments[each.value.comp_name]
  reporting_region      = each.value.region_name
  status                = each.value.status
  self_manage_resources = each.value.self_manage_resources
}


resource "oci_cloud_guard_target" "this" {
  provider             = oci.home
  depends_on           = [oci_cloud_guard_cloud_guard_configuration.this]
  for_each             = var.cloud_guard_target
  compartment_id       = var.compartments[each.value.comp_name]
  display_name         = each.value.display_name
  target_resource_id   = var.cloud_guard_target_resource[each.value.target_name]
  target_resource_type = each.value.target_type
  dynamic "target_detector_recipes" {
    iterator = recipe
    for_each = length(data.oci_cloud_guard_detector_recipes.existing.detector_recipe_collection) > 0 ? data.oci_cloud_guard_detector_recipes.existing.detector_recipe_collection[0].items : []

    content {
      detector_recipe_id = recipe.value["id"]

    }
  }
  dynamic "target_responder_recipes" {
    iterator = recipe
    for_each = length(data.oci_cloud_guard_responder_recipes.existing.responder_recipe_collection) > 0 ? data.oci_cloud_guard_responder_recipes.existing.responder_recipe_collection[0].items : []
    content {
      responder_recipe_id = recipe.value["id"]
    }
  }
}

