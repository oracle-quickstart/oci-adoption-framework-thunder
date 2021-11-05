// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

provider "oci" {
  tenancy_ocid     = var.provider_oci.tenancy
  user_ocid        = var.provider_oci.user_id
  fingerprint      = var.provider_oci.fingerprint
  private_key_path = var.provider_oci.key_file_path
  region           = var.provider_oci.region
}

module "blockchain" {
  source            = "../../modules/blockchain"
  compartments      = var.compartments
  blockchain_params = var.blockchain_params
  osn_params        = var.osn_params
  peer_params       = var.peer_params
  oci_provider      = var.provider_oci
}
