// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "bastion_params" {
  type = map(object({
    bastion_name               = string
    bastion_type               = string
    comp_name                  = string
    subnet_name                = string
    cidr_block_allow_list      = list(string)
    max_session_ttl_in_seconds = number
  }))
}

variable "compartments" {
  type = map(string)
}

variable "subnets" {
  type = map(string)
}
