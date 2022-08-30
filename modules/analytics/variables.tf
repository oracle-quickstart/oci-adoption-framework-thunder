// Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "compartment_ids" {
  type = map(string)
}

variable "subnet_ids" {
  type = map(string)
}

variable "vcn_ids" {
  type = map(string)
}

variable "oac_params" {
  description = "Placeholder for the parameters of the OAC instances"
  type = map(object({
    capacity_type        = string
    capacity_value       = number
    compartment_name     = string
    feature_set          = string
    idcs_token_path      = string
    license_type         = string
    display_name         = string
    description          = string
    network_type         = string
    subnet_name          = string
    vcn_name             = string
  }))
}