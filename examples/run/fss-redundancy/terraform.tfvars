// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
compartment_ids = {
  sandbox = "ocid1...."
}

subnet_ids = {
  hur2pub = "ocid1...."
  hur1pub = "ocid1...."
}

nsgs = {}

# --------------------------------- Source region

fss_params = {
  thunder1 = {
    ad               = 1
    compartment_name = "sandbox"
    name             = "thunder1"
    kms_key_name     = ""
  },
  thunder2 = {
    ad               = 2
    compartment_name = "sandbox"
    name             = "thunder2"
    kms_key_name     = ""
  }
}

mt_params = {
  mt1 = {
    ad               = 1
    compartment_name = "sandbox"
    name             = "mt1"
    subnet_name      = "hur1pub"
  },
  mt2 = {
    ad               = 2
    compartment_name = "sandbox"
    name             = "mt2"
    subnet_name      = "hur1pub"
  }
}

export_params = {
  mt1 = {
    export_set_name = "mt1"
    filesystem_name = "thunder1"
    path            = "/source"

    export_options = [
      {
        source   = "0.0.0.0/0"
        access   = "READ_WRITE"
        identity = "NONE"
        use_port = false
      },
    ]
  },
  mt2 = {
    export_set_name = "mt2"
    filesystem_name = "thunder2"
    path            = "/dest"

    export_options = [
      {
        source   = "0.0.0.0/0"
        access   = "READ_WRITE"
        identity = "NONE"
        use_port = false
      },
    ]
  },
}

kms_key_ids = {}

# --------------------------------- Dest region

fss_params_second = {
   thunder3 = {
     ad               = 2
     compartment_name = "sandbox"
     name             = "thunder3"
     kms_key_name     = ""
   },
}

mt_params_second = {
   mt3 = {
     ad               = 2
     compartment_name = "sandbox"
     name             = "mt3"
     subnet_name      = "hur2pub"
   },
}

export_params_second = {
   mt3 = {
     export_set_name = "mt3"
     filesystem_name = "thunder3"
     path            = "/dest-second"

     export_options = [
       {
         source   = "0.0.0.0/0"
         access   = "READ_WRITE"
         identity = "NONE"
         use_port = false
       },
     ]
   },
}

kms_key_ids_second = {}

# -------------------------------------------- Instance

linux_images = {
  ap-melbourne-1  = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-mumbai-1     = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-osaka-1      = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-seoul-1     = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-sydney-1    = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-tokyo-1     = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ca-montreal-1  = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ca-toronto-1   = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  eu-amsterdam-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  eu-frankfurt-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  eu-zurich-1    = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  me-jeddah-1    = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  sa-saopaulo-1   = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  uk-gov-london-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  uk-london-1     = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  us-ashburn-1    = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  us-langley-1    = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  us-luke-1       = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  us-phoenix-1    = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
}

instance_params = {
  hur1 = {
    ad                   = 1
    source_instance_name = ""
    shape                = "VM.Standard2.8"
    hostname             = "hur1"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    src_mount_name         = "mt1"
    dst_mount_name         = "mt2"
    src_mount_path         = "/mnt/source"
    dst_mount_path         = "/mnt/dest"
    src_export_path        = "/source"
    dst_export_path        = "/dest"
    data_sync_frequency  = "*/5 * * * *"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    block_vol_att_type = ""
    encrypt_in_transit = true
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
}

instance_params_second = {
  hur2 = {
    ad                   = 1
    source_instance_name = "hur1"
    shape                = "VM.Standard2.8"
    hostname             = "hur2"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "sandbox"
    subnet_name          = "hur2pub"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    ssh_private_key      = "/root/.ssh/id_rsa"
    dst_second_mount_name  = "mt3"
    src_mount_path         = "/mnt/source"
    dst_mount_path_second  = "/mnt/dest-second"
    dst_export_path_second = "/dest-second"
    data_sync_frequency  = "*/5 * * * *"
    device_disk_mappings     = ""
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    block_vol_att_type = ""
    encrypt_in_transit = true
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
}
