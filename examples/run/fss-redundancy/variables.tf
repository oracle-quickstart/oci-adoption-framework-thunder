// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "provider_oci" {
  type = map(string)
}

variable "compartment_ids" {
  type = map(string)
}

variable "subnet_ids" {
  type = map(string)
}

# Source region

variable "fss_params" {
  type = map(object({
    ad               = number
    compartment_name = string
    name             = string
    kms_key_name     = string
  }))
}

variable "mt_params" {
  type = map(object({
    ad               = number
    compartment_name = string
    name             = string
    subnet_name      = string
  }))
}

variable "export_params" {
  type = map(object({
    export_set_name = string
    filesystem_name = string
    path            = string
    export_options = list(object({
      source   = string
      access   = string
      identity = string
      use_port = bool
    }))
  }))
}

variable "kms_key_ids" {
  type = map(string)
}

# Dest region

variable "fss_params_second" {
  type = map(object({
    ad               = number
    compartment_name = string
    name             = string
    kms_key_name     = string
  }))
}

variable "mt_params_second" {
  type = map(object({
    ad               = number
    compartment_name = string
    name             = string
    subnet_name      = string
  }))
}

variable "export_params_second" {
  type = map(object({
    export_set_name = string
    filesystem_name = string
    path            = string
    export_options = list(object({
      source   = string
      access   = string
      identity = string
      use_port = bool
    }))
  }))
}

variable "kms_key_ids_second" {
  type = map(string)
}

# Instance

variable "linux_images" {
  type = map(map(string))
}

variable "nsgs" {
  type = map(string)
}

variable "instance_params" {
  description = "Placeholder for the parameters of the instances"
  type = map(object({
    ad                   = number
    source_instance_name = string
    shape                = string
    hostname             = string
    boot_volume_size     = number
    assign_public_ip     = bool
    preserve_boot_volume = bool
    compartment_name     = string
    subnet_name          = string
    ssh_public_key       = string
    device_disk_mappings = string
    freeform_tags        = map(string)
    kms_key_name         = string
    block_vol_att_type   = string
    encrypt_in_transit   = bool
    fd                   = number
    image_version        = string
    nsgs                 = list(string)
    src_mount_name       = string
    dst_mount_name       = string
    src_mount_path       = string
    dst_mount_path       = string
    src_export_path      = string
    dst_export_path      = string
    data_sync_frequency  = string
  }))
}

# Dest region

variable "instance_params_second" {
  description = "Placeholder for the parameters of the instances"
  type = map(object({
    ad                   = number
    source_instance_name = string
    shape                = string
    hostname             = string
    boot_volume_size     = number
    assign_public_ip     = bool
    preserve_boot_volume = bool
    compartment_name     = string
    subnet_name          = string
    ssh_public_key       = string
    ssh_private_key      = string
    device_disk_mappings = string
    freeform_tags        = map(string)
    kms_key_name         = string
    block_vol_att_type   = string
    encrypt_in_transit   = bool
    fd                   = number
    image_version        = string
    nsgs                 = list(string)
    dst_second_mount_name  = string
    src_mount_path         = string
    dst_mount_path_second  = string
    dst_export_path_second = string
    data_sync_frequency    = string
  }))
}
