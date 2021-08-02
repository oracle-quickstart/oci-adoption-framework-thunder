// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "provider_oci" {
  type = map(string)
}

variable "instance_principal_params" {
  type = map(object({
    dg_description      = string
    dg_name             = string
    policy_description  = string
    policy_name         = string
    instance_name       = string
  }))
}

variable "instances" {
  type = map(string)
}
