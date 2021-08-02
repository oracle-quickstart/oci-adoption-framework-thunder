// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "provider_path" {
  type = string
}

variable "compartment_ids" {
  type = map(string)
}

variable "vcns" {
  description = "The list of vcns"
  type        = map(map(string))
}

variable "vcns2" {
  description = "The list of vcns"
  type        = map(map(string))
}

variable "rpg_params" {
  description = "The parameters for the DRG"
  type = list(object({
    compartment_name   = string
    vcn_name_requestor = string
    vcn_name_acceptor  = string
  }))
}

variable "requestor_region" {}
variable "acceptor_region" {}
