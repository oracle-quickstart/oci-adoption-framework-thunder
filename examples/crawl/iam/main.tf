// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
provider "oci" {
  tenancy_ocid     = var.provider_oci.tenancy
  user_ocid        = var.provider_oci.user_id
  fingerprint      = var.provider_oci.fingerprint
  private_key_path = var.provider_oci.key_file_path
  region           = var.provider_oci.region
}

module "iam" {
  source              = "../../../modules/iam"
  comp_params         = var.comp_params
  user_params         = var.user_params
  group_params        = var.group_params
  policy_params       = var.policy_params
  auth_provider       = var.provider_oci
}
