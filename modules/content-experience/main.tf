provider "oci" {
  tenancy_ocid     = var.oci_provider.tenancy
  user_ocid        = var.oci_provider.user_id
  fingerprint      = var.oci_provider.fingerprint
  private_key_path = var.oci_provider.key_file_path
  region           = data.oci_identity_regions.existing.regions[0].name
  alias            = "home"
}

data "oci_identity_tenancy" "existing" {
  tenancy_id = var.oci_provider.tenancy
}

data "oci_identity_regions" "existing" {
  filter {
    name   = "key"
    values = [data.oci_identity_tenancy.existing.home_region_key]
  }
}

data "oci_objectstorage_namespace" "this" {
  compartment_id = var.oci_provider["tenancy"]
}

resource "oci_oce_oce_instance" "this" {
  provider                 = oci.home
  for_each                 = var.oce_params
  admin_email              = each.value.admin_email
  compartment_id           = var.compartments[each.value.compartment_name]
  idcs_access_token        = each.value.idcs_access_token
  name                     = each.value.name
  object_storage_namespace = data.oci_objectstorage_namespace.this.namespace
  tenancy_id               = var.oci_provider.tenancy
  tenancy_name             = data.oci_identity_tenancy.existing.name
}
