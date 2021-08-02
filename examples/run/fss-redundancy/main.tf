// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

# Source region

provider "oci" {
  alias  = "first"
  region = var.provider_oci.region

  tenancy_ocid         = var.provider_oci.tenancy
  user_ocid            = var.provider_oci.user_id
  fingerprint          = var.provider_oci.fingerprint
  private_key_path     = var.provider_oci.key_file_path
}

module "fss_source" {
  source        = "../../../modules/fss"
  providers        = { oci = oci.first }
  compartments  = var.compartment_ids
  subnets       = var.subnet_ids
  fss_params    = var.fss_params
  mt_params     = var.mt_params
  export_params = var.export_params
  kms_key_ids   = var.kms_key_ids
}

# Client instance

module "compute" {
  source              = "../../../modules/fss-instance-client-local"
  providers           = { oci = oci.first }
  compartment_ids     = var.compartment_ids
  mount_targets_src   = module.fss_source.mount_targets
  subnet_ids          = var.subnet_ids
  instance_params     = var.instance_params
  region              = var.provider_oci.region
  linux_images        = var.linux_images
  kms_key_ids         = var.kms_key_ids
  nsgs                = var.nsgs
}

# Destination region

 provider "oci" {
   alias  = "second"
   region = var.provider_oci.region2

   tenancy_ocid         = var.provider_oci.tenancy
   user_ocid            = var.provider_oci.user_id
   fingerprint          = var.provider_oci.fingerprint
   private_key_path     = var.provider_oci.key_file_path
 }

 module "fss_second" {
   source        = "../../../modules/fss"
   providers        = { oci = oci.second }
   compartments  = var.compartment_ids
   subnets       = var.subnet_ids
   fss_params    = var.fss_params_second
   mt_params     = var.mt_params_second
   export_params = var.export_params_second
   kms_key_ids   = var.kms_key_ids_second
 }

# Client instance

module "compute_second" {
  source              = "../../../modules/fss-instance-client-dest"
  providers           = { oci = oci.second }
  compartment_ids     = var.compartment_ids
  mount_targets_src   = module.fss_second.mount_targets
  subnet_ids          = var.subnet_ids
  instance_params     = var.instance_params_second
  region              = var.provider_oci.region2
  linux_images        = var.linux_images
  kms_key_ids         = var.kms_key_ids_second
  nsgs                = var.nsgs
  src_instance_pip    = module.compute.instance_public_ip
}
