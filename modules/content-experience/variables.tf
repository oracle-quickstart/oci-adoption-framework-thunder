variable "oci_provider" {
  type = map(string)
}

variable "compartments" {
  type = map(string)
}

variable "oce_params" {
  type = map(object({
    admin_email       = string
    compartment_name  = string
    idcs_access_token = string
    name              = string
  }))
}
