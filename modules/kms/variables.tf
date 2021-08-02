// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "compartment_ids" {
  type = map(string)
}

variable "vault_params" {
  type = map(object({
    compartment_name = string
    display_name     = string
    vault_type       = string
  }))

}

variable "key_params" {
  type = map(object({
    compartment_name        = string
    display_name            = string
    vault_name              = string
    key_shape_algorithm     = string
    key_shape_size_in_bytes = number
    rotation_version        = number
  }))
}
