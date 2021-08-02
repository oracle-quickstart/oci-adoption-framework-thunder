// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

gluster_params = {
  replica_number = ""
  volume_type    = "distributed"
}

ssh_public_key  = "/home/opc/.ssh/id_rsa.pub"
ssh_private_key = "/home/opc/.ssh/id_rsa"

images = {
  ap-mumbai-1    = "ocid1...."
  ap-seoul-1     = "ocid1...."
  ap-sydney-1    = "ocid1...."
  ap-tokyo-1     = "ocid1...."
  ca-toronto-1   = "ocid1...."
  eu-frankfurt-1 = "ocid1...."
  eu-zurich-1    = "ocid1...."
  sa-saopaulo-1  = "ocid1...."
  uk-london-1    = "ocid1...."
  us-ashburn-1   = "ocid1...."
  us-langley-1   = "ocid1...."
  us-luke-1      = "ocid1...."
  us-phoenix-1   = "ocid1...."
}

instance_params = {
  gfstest1 = {
    ad                   = 1
    shape                = "VM.Standard2.8"
    hostname             = "gfstest1"
    preserve_boot_volume = true
    comp_id              = "ocid1...."
    subnet_id            = "ocid1...."
  }
  gfstest2 = {
    ad                   = 2
    shape                = "VM.Standard2.8"
    hostname             = "gfstest2"
    preserve_boot_volume = true
    comp_id              = "ocid1...."
    subnet_id            = "ocid1...."
  }
}

bv_params = {
  gfstest11 = {
    name          = "gfstest11"
    size_in_gbs   = 100
    instance_name = "gfstest1"
  }
  gfstest21 = {
    name          = "gfstest21"
    size_in_gbs   = 100
    instance_name = "gfstest2"
  }
}
