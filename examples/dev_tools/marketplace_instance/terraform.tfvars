// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
compartment_ids = {
  sandbox = "ocid1...."
}

subnet_ids = {
  hur1pub = "ocid1...."
}

instance_params = {
  inst1 = {
    ad                   = 1
    shape                = "VM.Standard2.4"
    hostname             = "inst1"
    boot_volume_size     = 120
    preserve_boot_volume = true
    assign_public_ip     = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    block_vol_att_type = "iscsi"
    encrypt_in_transit = false
    fd                 = 1
    nsgs               = []
    image_version      = "ocid1...."
    listing_id               = "ocid1...."
    listing_resource_version = "6.4.0_Paravirtualized_Mode"
  }
  inst2 = {
    ad                   = 1
    shape                = "VM.Standard2.4"
    hostname             = "inst2"
    boot_volume_size     = 120
    use_custom_image     = "true"
    assign_public_ip     = false
    preserve_boot_volume = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    nsgs               = []
    image_version      = "ocid1...."
    listing_id               = "ocid1...."
    listing_resource_version = "FlexDeploy_5.3"
  }
}

nsgs = {}
kms_key_ids = {}
