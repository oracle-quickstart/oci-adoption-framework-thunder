// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "function_id" {
  type = map(string)
}

variable "topic_id" {
  type = map(string)
}

variable "stream_id" {
  type = map(string)
}

variable "compartment_ids" {
  type = map(any)
}

variable "events_params" {
  type = map(object({
    rule_display_name = string
    compartment_name  = string
    rule_is_enabled   = bool
    condition         = any
    freeform_tags     = map(any)
    action_params = list(object({
      action_type         = string
      is_enabled          = bool
      actions_description = string
      function_name       = string
      topic_name          = string
      stream_name         = string

    }))
  }))
}



