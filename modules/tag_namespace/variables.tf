// Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "tag_namespace_params" {
  type = map(object({
    compartment_name = string
    description      = string
    name             = string
  }))
}

variable "tag_key_params" {
  type = map(object({
    description       = string
    name              = string
    tagnamespace_name = string
    is_cost_tracking  = bool
    validator_type    = string
    values            = list(string)
  }))
}

variable "compartments" {
  type = map(string)
}
