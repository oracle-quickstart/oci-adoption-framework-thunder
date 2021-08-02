// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartment_ids = {
  sandbox = "ocid1...."
}
subnet_ids = {
  hur1pub  = "ocid1...."
  hur1priv = "ocid1...."
}

nsgs = {
  hurricane1 = "ocid1...."
  hurricane2 = "ocid1...."
}

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
    shape                = "VM.Standard2.8"
    hostname             = "hur1"
    boot_volume_size     = 120
    preserve_boot_volume = true
    assign_public_ip     = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = "/u01:/dev/oracleoci/oraclevdb /u05:/dev/oracleoci/oraclevdc /u80:/dev/oracleoci/oraclevdd /u02:/dev/oracleoci/oraclevde /u03:/dev/oracleoci/oraclevdf /u04:/dev/oracleoci/oraclevdg"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    block_vol_att_type = "iscsi"
    encrypt_in_transit = true
    fd                 = 1
    image_version      = "oel7"
    nsgs               = ["hurricane1"]
  }
  hur2 = {
    ad                   = 1
    shape                = "VM.Standard2.8"
    hostname             = "hur2"
    boot_volume_size     = 120
    use_custom_image     = "true"
    assign_public_ip     = false
    preserve_boot_volume = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = "/u01:/dev/oracleoci/oraclevdb"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = true
    fd                 = 1
    image_version      = "oel6"
    nsgs               = []
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
    kms_key_name       = ""
    performance        = "High"
    encrypt_in_transit = true 
  }
  bv11 = {
    ad            = 1
    display_name  = "bv11"
    bv_size       = 70
    instance_name = "hur1"
    device_name   = "/dev/oracleoci/oraclevdc"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = false
  }
  bv12 = {
    ad            = 1
    display_name  = "bv12"
    bv_size       = 60
    instance_name = "hur1"
    device_name   = "/dev/oracleoci/oraclevdd"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = false
  }
  bv13 = {
    ad            = 1
    display_name  = "bv13"
    bv_size       = 80
    instance_name = "hur1"
    device_name   = "/dev/oracleoci/oraclevde"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = false
  }
  bv14 = {
    ad            = 1
    display_name  = "bv14"
    bv_size       = 90
    instance_name = "hur1"
    device_name   = "/dev/oracleoci/oraclevdf"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = false
  }
  bv15 = {
    ad            = 1
    display_name  = "bv15"
    bv_size       = 100
    instance_name = "hur1"
    device_name   = "/dev/oracleoci/oraclevdg"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = false
  }
  bv20 = {
    ad            = 1
    display_name  = "bv20"
    bv_size       = 50
    instance_name = "hur2"
    device_name   = "/dev/oracleoci/oraclevdb"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = true
  }
}

windows_images = {
 ap-melbourne-1  = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  ap-mumbai-1     = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  ap-osaka-1      = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  ap-seoul-1     = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  ap-sydney-1    = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  ap-tokyo-1     = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  ca-montreal-1  = {
    win2012 = ""
    win2016 = ""
  }
  ca-toronto-1   = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  eu-amsterdam-1 = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  eu-frankfurt-1 = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  eu-zurich-1    = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  me-jeddah-1    = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  sa-saopaulo-1   = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  uk-gov-london-1 = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  uk-london-1     = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  us-ashburn-1    = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  us-langley-1    = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  us-luke-1       = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
  us-phoenix-1    = {
    win2012 = "ocid1...."
    win2016 = "ocid1...."
  }
}

win_instance_params = {
  win01 = {
    ad                   = 1
    shape                = "VM.Standard2.4"
    hostname             = "win01"
    boot_volume_size     = 400
    assign_public_ip     = true
    preserve_boot_volume = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    device_disk_mappings = "D:50GB E:60GB F:60GB"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    enable_admin       = "yes"
    fd                 = 1
    image_version      = "win2016"
    nsgs               = ["hurricane1"]
  }
  win02 = {
    ad                   = 1
    shape                = "VM.Standard2.4"
    hostname             = "win02"
    boot_volume_size     = 400
    assign_public_ip     = true
    preserve_boot_volume = true
    compartment_name     = "sandbox"
    subnet_name          = "hur1pub"
    device_disk_mappings = "D:50GB E:90GB F:90GB"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    block_vol_att_type = "iscsi"
    encrypt_in_transit = false
    enable_admin       = "no"
    fd                 = 1
    image_version      = "win2016"
    nsgs               = []
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
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = false
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
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = false
  }
  winbv12 = {
    ad            = 1
    display_name  = "winbv12"
    bv_size       = 60
    instance_name = "win01"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = false
  }
  winbv20 = {
    ad            = 1
    display_name  = "winbv20"
    bv_size       = 90
    instance_name = "win02"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "Balanced"
    encrypt_in_transit = true
  }
  winbv21 = {
    ad            = 1
    display_name  = "winbv21"
    bv_size       = 50
    instance_name = "win02"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "High"
    encrypt_in_transit = false
  }
  winbv22 = {
    ad            = 1
    display_name  = "winbv22"
    bv_size       = 90
    instance_name = "win02"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name       = ""
    performance        = "High"
    encrypt_in_transit = false
  }
}

kms_key_ids = {}
