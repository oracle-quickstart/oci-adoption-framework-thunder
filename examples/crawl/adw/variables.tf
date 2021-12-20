// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "provider_oci" {
  type = map(string)
}

variable "adw_params" {
  type = map(object({
    compartment_name    = string
    cpu_core_count      = number
    size_in_tbs         = number
    db_name             = string
    db_workload         = string
    enable_auto_scaling = bool
    is_free_tier        = bool
    create_local_wallet = bool
    subnet_name         = string
  }))
}

variable "compartment_ids" {
  type = map(string)
}
