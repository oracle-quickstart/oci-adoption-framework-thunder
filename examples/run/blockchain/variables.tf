// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


variable "provider_oci" {
  type = map(string)
}

variable "compartments" {
  type = map(string)
}

variable "blockchain_params" {
  type = map(object({
    compartment_name  = string
    compute_shape     = string
    idcs_access_token = string
    name              = string
    platform_role     = string
  }))
}

variable "osn_params" {
  type = map(object({
    ad            = string
    platform_name = string
    ocpu          = number
  }))
}

variable "peer_params" {
  type = map(object({
    ad            = string
    platform_name = string
    ocpu          = number
    role          = string
    alias         = string
  }))
}
