// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "compartment_ids" {
  type = map(string)
}

variable "cluster_params" {
  type = map(object({
    compartment_name   = string
    kubernetes_version = string
    # encryption
    use_encryption                  = bool
    kms_key_id                      = string
    cluster_name                    = string
    vcn_name                        = string
    is_kubernetes_dashboard_enabled = bool
    is_tiller_enabled               = bool
    pods_cidr                       = string
    services_cidr                   = string
    service_lb_subnet_names         = list(string)
  }))
}

variable "nodepools_params" {
  type = map(object({
    compartment_name = string
    cluster_name     = string
    pool_name        = string
    subnet_name      = string
    size             = number
    node_shape       = string
    ssh_public_key   = string
    placement_configs = list(object({
    ad     = number
    subnet = string
     }))
  }))
}


variable "linux_images" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "vcn_ids" {
  type = map(string)
}

variable "subnet_ids" {
  type = map(string)
}
