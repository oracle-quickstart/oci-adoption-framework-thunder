// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

provider "oci" {
  tenancy_ocid     = var.provider_oci.tenancy
  user_ocid        = var.provider_oci.user_id
  fingerprint      = var.provider_oci.fingerprint
  private_key_path = var.provider_oci.key_file_path
  region           = var.provider_oci.region
}

module "iam_top_comp" {
  source        = "../../modules/iam"
  comp_params   = var.comp_params
  parent_comp   = var.parent_comp
  user_params   = var.user_params
  group_params  = var.group_params
  policy_params = var.policy_params
  auth_provider = var.provider_oci
}

module "iam" {
  source        = "../../modules/iam"
  comp_params   = var.comp_params2
  parent_comp   = module.iam_top_comp.compartment_maps
  user_params   = {}
  group_params  = var.group_params2
  policy_params = var.policy_params2
  auth_provider = var.provider_oci
}


module "dynamic_groups" {
  source                = "../../modules/dynamic_group"
  dynamic_groups        = var.dynamic_groups
  matching_compartments = merge(module.iam_top_comp.compartment_maps, module.iam.compartment_maps)
  auth_provider         = var.provider_oci
}
