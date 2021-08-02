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

variable "lb_params" {
  type = map(object({
    shape            = string
    compartment_name = string
    subnet_names     = list(string)
    display_name     = string
    is_private       = bool
    shape_details = list(object({
      min_bw = number
      max_bw = number
    }))
  }))
}

variable "backend_sets" {
  type = map(object({
    name        = string
    lb_name     = string
    policy      = string
    hc_port     = number
    hc_protocol = string
    hc_url      = string
  }))
}

# Using list(any) due to the fact that we have some optional parameters in the maps
variable "listeners" {
  type = map(any)
}

variable "certificates" {
  type = map(any)
}

variable "backend_params" {
  type = map(any)
}

variable "private_ip_instances" {
  type = map(any)
}
