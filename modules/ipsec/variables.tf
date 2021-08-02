// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "ipsec_params" {
  type = map(object({
    comp_name      = string
    cpe_ip_address = string
    name           = string
    drg_name       = string
    static_routes  = list(string)
  }))
}

variable "compartments" {
  type = map(string)
}

variable "drgs" {
  type = map(string)
}
