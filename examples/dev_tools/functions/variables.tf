// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "provider_oci" {
  type = map(string)
}

variable "compartment_ids" {
  type = map(string)
}

variable "subnet_ids" {
  type = map(string)
}

variable "app_params" {
  type = map(object({
    compartment_name = string
    subnet_name      = list(string)
    display_name     = string
    config           = map(string)
    freeform_tags    = map(string)
  }))
}

variable "fn_params" {
  type = map(object({
    function_app       = string
    display_name       = string
    image              = string
    memory_in_mbs      = number
    image_digest       = string
    timeout_in_seconds = number
    config             = map(string)
    freeform_tags      = map(string)
  }))
}
