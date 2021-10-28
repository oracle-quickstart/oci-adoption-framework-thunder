// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "cloud_guard_config" {
  type = map(object({
    comp_name             = string
    status                = string
    self_manage_resources = bool
    region_name           = string
  }))
}


variable "cloud_guard_target" {
  type = map(object({
    comp_name    = string
    display_name = string
    target_name  = string
    target_type  = string
  }))
}

variable "compartments" {
  type = map(string)
}


variable "cloud_guard_target_resource" {
  type = map(string)
}


variable "auth_provider" {
  type = map(string)
}
