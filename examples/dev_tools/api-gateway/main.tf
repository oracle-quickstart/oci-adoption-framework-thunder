// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
provider "oci" {
  tenancy_ocid     = var.provider_oci.tenancy
  user_ocid        = var.provider_oci.user_id
  fingerprint      = var.provider_oci.fingerprint
  private_key_path = var.provider_oci.key_file_path
  region           = var.provider_oci.region
}

module "api-gateway" {
  source          = "../../../modules/api-gateway"
  compartment_ids = var.compartment_ids
  subnet_ids      = var.subnet_ids
  function_ids    = var.function_ids
  apigw_params    = var.apigw_params
  gwdeploy_params = var.gwdeploy_params
}


