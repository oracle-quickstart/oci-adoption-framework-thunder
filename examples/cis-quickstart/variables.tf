// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "provider_oci" {
  type = map(string)
}

## IAM modules variables
variable "comp_params" {
  type = map(object({
    name          = string
    description   = string
    enable_delete = bool
    parent_name   = string
  }))
}

variable "parent_comp" {
  type        = map(any)
  default     = {}
  description = "Leave it empty if you want to create compartments under tenancy"
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

variable "group_params2" {
  type = map(object({
    name        = string
    description = string
  }))
}

variable "policy_params" {
  type = map(object({
    name             = string
    description      = string
    compartment_name = string
    statements       = list(string)
  }))
}

variable "policy_params2" {
  type = map(object({
    name             = string
    description      = string
    compartment_name = string
    statements       = list(string)
  }))
}

variable "comp_params2" {
  type = map(object({
    name          = string
    description   = string
    enable_delete = bool
    parent_name   = string
  }))
}

### Dynamic groups variables
variable "dynamic_groups" {
  type = map(object({
    name                      = string
    description               = string
    resource_type             = string
    matching_compartment_name = string
  }))
}
