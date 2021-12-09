// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "compartments" {
  type = map(string)
}

variable "log_resources" {
  type = map(string)
}

variable "log_group_params" {
  type = map(object({
    comp_name      = string
    log_group_name = string
  }))
}


variable "log_params" {
  type = map(object({
    log_name            = string
    log_group           = string
    log_type            = string
    source_log_category = string
    source_resource     = string
    source_service      = string
    source_type         = string
    comp_name           = string
    is_enabled          = bool
    retention_duration  = number
  }))
}


