// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartment_ids = {
  sandbox = "ocid1...."
}
subnet_ids = {
  hur1pub = "ocid1...."
  hur1priv = "ocid1...."
}

linux_images = {
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
  hur1 = {
    ad                   = 1
    shape                = "VM.Standard2.8"
    hostname             = "hur1"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    ssh_public_key       = "/home/ionut/Documents/personal/keys/id_rsa.pub"
    device_disk_mappings = "/u01:/dev/oracleoci/oraclevdb /u02:/dev/oracleoci/oraclevdc"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name = "key-hur1"
  }
}

bv_params = {
  bv10 = {
    ad            = 1
    display_name  = "bv10"
    bv_size       = 50
    instance_name = "hur1"
    device_name   = "/dev/oracleoci/oraclevdb"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name = "key-hur2"
  }
  bv11 = {
    ad            = 1
    display_name  = "bv11"
    bv_size       = 60
    instance_name = "hur1"
    device_name   = "/dev/oracleoci/oraclevdc"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name = ""
  }
}

windows_images = {
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

win_instance_params = {
  win01 = {
    ad                   = 1
    shape                = "VM.Standard2.4"
    hostname             = "win01"
    boot_volume_size     = 400
    assign_public_ip     = true
    preserve_boot_volume = false
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    device_disk_mappings = "D:50GB E:60GB"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name = "key-hur3"
  }
}

win_bv_params = {
  winbv10 = {
    ad            = 1
    display_name  = "winbv10"
    bv_size       = 50
    instance_name = "win01"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name = "key-hur2"
  }
  winbv11 = {
    ad            = 1
    display_name  = "winbv11"
    bv_size       = 60
    instance_name = "win01"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name = ""
  }
}

fss_params = {
  thunder1 = {
    ad               = 1
    compartment_name = "sandbox"
    name             = "thunder1"
    kms_key_name     = "key-hur1"
  }
}

mt_params = {
  mt1 = {
    ad               = 1
    compartment_name = "sandbox"
    name             = "mt1"
    subnet_name      = "hur1pub"
  }

  mt2 = {
    ad               = 1
    compartment_name = "sandbox"
    name             = "mt2"
    subnet_name      = "hur1pub"
  }
}

export_params = {
  mt1 = {
    export_set_name = "mt1"
    filesystem_name = "thunder1"
    path            = "/media"

    export_options = [
      {
        source   = "0.0.0.0/0"
        access   = "READ_WRITE"
        identity = "NONE"
        use_port = false
      },
    ]
  }
}

bucket_params = {
  hur-buck-1 = {
    compartment_name = "sandbox"
    name             = "hur-buck-1"
    access_type      = "NoPublicAccess"
    storage_tier     = "Standard"
    events_enabled   = false
    kms_key_name     = "key-hur2"
  }
}

vault_params = {
  vault-hur1 = {
    compartment_name = "sandbox"
    display_name     = "vault-hur1"
    vault_type       = "DEFAULT"
  }
}

key_params = {
  key-hur1 = {
    compartment_name        = "sandbox"
    display_name            = "key-hur1"
    vault_name              = "vault-hur1"
    key_shape_algorithm     = "AES"
    key_shape_size_in_bytes = 16
    rotation_version        = 0
  }
  key-hur2 = {
    compartment_name        = "sandbox"
    display_name            = "key-hur2"
    vault_name              = "vault-hur1"
    key_shape_algorithm     = "AES"
    key_shape_size_in_bytes = 24
    rotation_version        = 0
  }
  key-hur3 = {
    compartment_name        = "sandbox"
    display_name            = "key-hur3"
    vault_name              = "vault-hur1"
    key_shape_algorithm     = "AES"
    key_shape_size_in_bytes = 32
    rotation_version        = 0
  }
}
