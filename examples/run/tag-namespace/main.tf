provider "oci" {
  tenancy_ocid     = var.provider_oci.tenancy
  user_ocid        = var.provider_oci.user_id
  fingerprint      = var.provider_oci.fingerprint
  private_key_path = var.provider_oci.key_file_path
  region           = var.provider_oci.region
}

module "tag-namespace" {
  source               = "../../modules/tag-namespace"
  compartments         = var.compartments
  tag_namespace_params = var.tag_namespace_params
  tag_key_params       = var.tag_key_params
}
