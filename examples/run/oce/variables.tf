// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "provider_oci" {
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
