// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "parent_comp" {
  type = map(any)
}

variable "comp_params" {
  type = map(object({
    name          = string
    parent_name   = string
    description   = string
    enable_delete = bool
  }))
}

variable "user_params" {
  type = map(object({
    name        = string
    description = string
    group_name  = string
  }))
}

variable "group_params" {
  type = map(object({
    name        = string
    description = string
  }))
}

variable "policy_params" {
  type = map(object({
    name             = string
    compartment_name = string
    description      = string
    statements       = list(string)
  }))
}

variable "auth_provider" {
  type = map(string)
}
