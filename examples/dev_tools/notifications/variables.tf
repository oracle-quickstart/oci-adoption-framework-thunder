// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "provider_oci" {
  type = map(string)
}

variable "compartments" {
  type = map(string)
}

variable "topic_params" {
  type = map(object({
    comp_name   = string
    topic_name  = string
    description = string
  }))
}

variable "subscription_params" {
  type = map(object({
    comp_name  = string
    endpoint   = string
    protocol   = string
    topic_name = string
  }))
}
