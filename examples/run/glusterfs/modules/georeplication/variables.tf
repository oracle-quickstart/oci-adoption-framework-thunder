// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "ssh_private_key" {
  type = string
}

variable "masters_private_ip" {
  type = list(string)
}

variable "slaves_private_ip" {
  type = list(string)
}
