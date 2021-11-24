// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


locals {
  kms_policy = {
    "lz-oss-key-policy" = {
      name             = "lz-oss-key-policy"
      compartment_name = "lz-top-cmp"
      description      = "Landing Zone policy for OCI services to access Vault service."
      statements = [
        "Allow service objectstorage-${var.provider_oci.region} to use keys in compartment lz-security-cmp where target.key.id = '${module.kms.kms_key_ids["lz-oss-key"]}'",
        "Allow group lz-database-admin-group to use key-delegate in compartment lz-security-cmp where target.key.id = '${module.kms.kms_key_ids["lz-oss-key"]}'",
        "Allow group lz-appdev-admin-group to use key-delegate in compartment lz-security-cmp where target.key.id = '${module.kms.kms_key_ids["lz-oss-key"]}'"
      ]
    }
  }
}



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
  dg_policy_params      = var.dg_policy_params
}


module "network" {
  source                = "../../modules/network"
  vcn_params            = var.vcn_params
  compartment_ids       = module.iam.compartments
  igw_params            = var.igw_params
  ngw_params            = var.ngw_params
  sgw_params            = var.sgw_params
  rt_params             = var.rt_params
  sl_params             = var.sl_params
  nsg_params            = var.nsg_params
  nsg_rules_params      = var.nsg_rules_params
  subnet_params         = var.subnet_params
  lpg_params            = var.lpg_params
  drg_params            = var.drg_params
  drg_attachment_params = var.drg_attachment_params
}

module "notifications" {
  source              = "../../modules/notifications"
  topic_params        = var.topic_params
  subscription_params = var.subscription_params
  compartments        = module.iam.compartments
}

module "object-storage" {
  source        = "../../modules/object-storage"
  compartments  = module.iam.compartments
  bucket_params = var.bucket_params
  oci_provider  = var.provider_oci
  kms_key_ids   = module.kms.kms_key_ids
}

module "kms" {
  source          = "../../modules/kms"
  compartment_ids = module.iam.compartments
  vault_params    = var.vault_params
  key_params      = var.key_params
}


module "kms_policy" {
  source        = "../../modules/iam"
  comp_params   = {}
  parent_comp   = module.iam_top_comp.compartment_maps
  user_params   = {}
  group_params  = {}
  policy_params = local.kms_policy
  auth_provider = var.provider_oci
}

module "logs" {
  source           = "../../modules/logging"
  log_group_params = var.log_group_params
  log_params       = var.log_params
  compartments     = module.iam.compartments
  log_resources    = merge(module.network.subnets_ids, module.object-storage.bucket_id)
}



module "vulnerability_scan" {
  source              = "../../modules/vulnerability_scan"
  compartments        = module.iam.compartments
  scan_recipes_params = var.scan_recipes_params
  scan_target_params  = var.scan_target_params
}

module "events" {
  source          = "../../modules/events"
  events_params   = var.events_params
  compartment_ids = merge(var.provider_oci, module.iam_top_comp.compartments)
  stream_id       = {}
  topic_id        = module.notifications.topic_id
  function_id     = {}
}


module "cloud_guard" {
  source                      = "../../modules/cloud_guard"
  cloud_guard_config          = var.cloud_guard_config
  cloud_guard_target          = var.cloud_guard_target
  compartments                = var.provider_oci
  cloud_guard_target_resource = var.provider_oci
  auth_provider               = var.provider_oci
}



