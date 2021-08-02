// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "instance_params" {
  type        = map(string)
  description = "Placeholder for the parameters of the grafana instance principal instance"
}

variable "ssh_public_key" {
  type        = string
  description = "path to ssh public key"
}

variable "ssh_private_key" {
  type        = string
  description = "path to ssh private key"
}

variable "home_region" {
  type        = string
  description = "Home region for tenancy"
}

variable "auth_provider" {
  type        = map(string)
}

variable "instance_principal_params" {
  type        = map(string)
  description = "parameters for instance principals"
}

variable "images" {
  type        = map(string)
  description = "The key:value pair of images that should be used for all the regions"
}
