// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartment_ids = {
  sandbox = "ocid1...."
}

vcn_params = {
  ntier = {
    compartment_name = "sandbox"
    display_name     = "ntier"
    vcn_cidr         = "10.0.0.0/16"
    dns_label        = "ntier"
  }
}

igw_params = {
  ntierigw = {
    display_name = "ntierigw"
    vcn_name     = "ntier"
  }
}

ngw_params = {
  ntierngw = {
    display_name = "ntierngw"
    vcn_name     = "ntier"
  }
}

rt_params = {
  ntier_pub_rt = {
    display_name = "ntier_pub_rt"
    vcn_name     = "ntier"
    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = true
        ngw_name    = null
        igw_name    = "ntierigw"
      }
    ]
  }
  ntier_priv_rt = {
    display_name = "ntier_priv_rt"
    vcn_name     = "ntier"
    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = false
        ngw_name    = "ntierngw"
        igw_name    = null
      }
    ]
  }
}

sl_params = {
  ntier_pub_sl = {
    vcn_name     = "ntier"
    display_name = "ntier_pub_sl"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      }
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "22"
            max = "22"
          }
        ]
        udp_options = []
      }
    ]
  }
  ntier_priv_sl = {
    vcn_name     = "ntier"
    display_name = "ntier_priv_sl"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      }
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "22"
            max = "22"
          }
        ]
        udp_options = []
      }
    ]
  }
}

nsg_params = {}

nsg_rules_params = {}


subnet_params = {
  pubsubnet = {
    display_name      = "pubsubnet"
    cidr_block        = "10.0.1.0/24"
    dns_label         = "pubsubnet"
    is_subnet_private = false
    sl_name           = "ntier_pub_sl"
    rt_name           = "ntier_pub_rt"
    vcn_name          = "ntier"
  }
  privsubnet1 = {
    display_name      = "privsubnet1"
    cidr_block        = "10.0.2.0/24"
    dns_label         = "privsubnet1"
    is_subnet_private = true
    sl_name           = "ntier_priv_sl"
    rt_name           = "ntier_priv_rt"
    vcn_name          = "ntier"
  }
  privsubnet2 = {
    display_name      = "privsubnet2"
    cidr_block        = "10.0.4.0/24"
    dns_label         = "privsubnet2"
    is_subnet_private = true
    sl_name           = "ntier_priv_sl"
    rt_name           = "ntier_priv_rt"
    vcn_name          = "ntier"
  }
}

lpg_params = {}

drg_params = {
  ntier_drg = {
    name     = "ntier_drg"
    vcn_name = "ntier"
  }
}
drg_attachment_params = {
  ntier_drg_attachment = {
    drg_name = "ntier_drg"
    vcn_name = "ntier"
    cidr_rt  = ["192.0.0.0/24"]
    rt_names = ["ntier_priv_rt"]
  }
}

ipsec_params = {
  ipsec_connection = {
    comp_name      = "sandbox"
    cpe_ip_address = "140.238.211.235"
    name           = "ipsec_connection"
    drg_name       = "ntier_drg"
    static_routes  = ["10.10.1.0/24"]
  }
}


#------------ Compute --------------
linux_images = {
  ap-melbourne-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-mumbai-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-osaka-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-seoul-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-sydney-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ap-tokyo-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ca-montreal-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  ca-toronto-1 = {
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
  eu-zurich-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  me-jeddah-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  sa-saopaulo-1 = {
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
  uk-london-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  us-ashburn-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  us-langley-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  us-luke-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
  us-phoenix-1 = {
    centos6 = "ocid1...."
    centos7 = "ocid1...."
    oel6    = "ocid1...."
    oel7    = "ocid1...."
  }
}

instance_params = {
  vm1 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "vm1"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "pubsubnet"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "ntier",
      "department" : "ntier"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  vm2 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "vm2"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "pubsubnet"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "ntier",
      "department" : "ntier"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  vm3 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "vm3"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "privsubnet1"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "ntier",
      "department" : "ntier"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  vm4 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "vm4"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "privsubnet1"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "ntier",
      "department" : "ntier"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
}

bv_params = {}

windows_images = {}

win_instance_params = {}

win_bv_params = {}
#-----------------------------------

#-------------- DBaaS --------------
database_params = {
  ntierdb = {
    compartment_name        = "sandbox"
    ad                      = 1
    cpu_core_count          = 2
    db_edition              = "ENTERPRISE_EDITION"
    db_name                 = "ntierdb"
    db_admin_password       = "BEstrO0ng_#11"
    db_workload             = "OLTP"
    pdb_name                = "cust1pdb"
    enable_auto_backup      = true
    db_version              = "12.1.0.2"
    display_name            = "ntierdb"
    disk_redundancy         = "HIGH"
    shape                   = "VM.Standard2.8"
    subnet_name             = "privsubnet2"
    ssh_public_key          = "/root/.ssh/id_rsa.pub"
    hostname                = "ntierdb"
    data_storage_size_in_gb = 256
    license_model           = "BRING_YOUR_OWN_LICENSE"
    node_count              = 1
  }
}



lb_params = {
  ntier_pub_lb = {
    shape            = "100Mbps"
    compartment_name = "sandbox"
    subnet_names     = ["pubsubnet"]
    display_name     = "ntier_pub_lb"
    is_private       = false
    shape_details    = []
  }
  ntier_priv_lb = {
    shape            = "100Mbps"
    compartment_name = "sandbox"
    subnet_names     = ["privsubnet1"]
    display_name     = "ntier_priv_lb"
    is_private       = true
    shape_details    = []
  }
}

backend_sets = {
  ntier_pub_bs = {
    name        = "ntier_pub_bs"
    lb_name     = "ntier_pub_lb"
    policy      = "ROUND_ROBIN"
    hc_port     = 80
    hc_protocol = "HTTP"
    hc_url      = "/"
  }
  ntier_priv_bs = {
    name        = "ntier_priv_bs"
    lb_name     = "ntier_priv_lb"
    policy      = "ROUND_ROBIN"
    hc_port     = 80
    hc_protocol = "HTTP"
    hc_url      = "/"
  }
}

listeners = {
  ntier_pub_list = {
    lb_name          = "ntier_pub_lb"
    name             = "ntier_pub_list"
    backend_set_name = "ntier_pub_bs"
    port             = 80
    protocol         = "HTTP"
    ssl              = []
  }
  ntier_priv_list = {
    lb_name          = "ntier_priv_lb"
    name             = "ntier_priv_list"
    backend_set_name = "ntier_priv_bs"
    port             = 80
    protocol         = "HTTP"
    ssl              = []
  }
}

backend_params = {
  vm1 = {
    backendset_name = "ntier_pub_bs"
    use_instance    = true
    instance_name   = "vm1"
    lb_name         = "ntier_pub_lb"
    port            = 80
    lb_backend_name = ""
  }
  vm2 = {
    backendset_name = "ntier_pub_bs"
    use_instance    = true
    instance_name   = "vm2"
    lb_name         = "ntier_pub_lb"
    port            = 80
    lb_backend_name = ""
  }
  vm3 = {
    backendset_name = "ntier_priv_bs"
    use_instance    = true
    instance_name   = "vm3"
    lb_name         = "ntier_priv_lb"
    port            = 80
    lb_backend_name = ""
  }
  vm4 = {
    backendset_name = "ntier_priv_bs"
    use_instance    = true
    instance_name   = "vm4"
    lb_name         = "ntier_priv_lb"
    port            = 80
    lb_backend_name = ""
  }
}

certificates = {}

kms_key_ids = {}
