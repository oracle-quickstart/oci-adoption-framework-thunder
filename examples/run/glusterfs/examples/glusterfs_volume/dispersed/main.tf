// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

provider "oci" {
  tenancy_ocid     = var.provider_oci.tenancy
  user_ocid        = var.provider_oci.user_id
  fingerprint      = var.provider_oci.fingerprint
  private_key_path = var.provider_oci.key_file_path
  region           = var.provider_oci.region
}

module "glusterfs_striped" {
  source          = "../../../modules/glusterfs"
  gluster_params  = var.gluster_params
  ssh_public_key  = var.ssh_public_key
  ssh_private_key = var.ssh_private_key
  instance_params = var.instance_params
  bv_params       = var.bv_params
  region          = var.provider_oci.region
  images          = var.images
}
