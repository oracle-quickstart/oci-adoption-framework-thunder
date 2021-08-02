// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartment_ids = {
  sandbox = "ocid1...."
}

vcn_params = {
  customer1 = {
    compartment_name = "sandbox"
    display_name     = "customer1"
    vcn_cidr         = "10.0.0.0/16"
    dns_label        = "customer1"
  }
  customer2 = {
    compartment_name = "sandbox"
    display_name     = "customer2"
    vcn_cidr         = "11.0.0.0/16"
    dns_label        = "customer2"
  }
}

igw_params = {
  customer1 = {
    display_name = "customer1"
    vcn_name     = "customer1"
  }
  customer2 = {
    display_name = "customer2"
    vcn_name     = "customer2"
  }
}

ngw_params = {}

rt_params = {
  customer1_pub_rt = {
    display_name = "customer1_pub_rt"
    vcn_name     = "customer1"
    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = true
        ngw_name    = null
        igw_name    = "customer1"
      }
    ]
  }
  customer1_priv_rt = {
    display_name = "customer1_priv_rt"
    vcn_name     = "customer1"
    route_rules  = []
  }

  customer2_pub_rt = {
    display_name = "customer2_pub_rt"
    vcn_name     = "customer2"
    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = true
        ngw_name    = null
        igw_name    = "customer2"
      }
    ]
  }
  customer2_priv_rt = {
    display_name = "customer2_priv_rt"
    vcn_name     = "customer2"
    route_rules  = []
  }
}

sl_params = {
  customer1_pub_sl = {
    vcn_name     = "customer1"
    display_name = "customer1_pub_sl"

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
        protocol    = "all"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = []
        udp_options = []
      }
    ]
  }
  customer1_priv_sl = {
    vcn_name     = "customer1"
    display_name = "customer1_priv_sl"

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
  customer2_pub_sl = {
    vcn_name     = "customer2"
    display_name = "customer2_pub_sl"

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
        protocol    = "all"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"

        tcp_options = []
        udp_options = []
      }
    ]
  }
  customer2_priv_sl = {
    vcn_name     = "customer2"
    display_name = "customer2_priv_sl"

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
  subnet1A = {
    display_name      = "subnet1A"
    cidr_block        = "10.0.1.0/24"
    dns_label         = "subnet1a"
    is_subnet_private = false
    sl_name           = "customer1_pub_sl"
    rt_name           = "customer1_pub_rt"
    vcn_name          = "customer1"
  }
  subnet1B = {
    display_name      = "subnet1B"
    cidr_block        = "10.0.2.0/24"
    dns_label         = "subnet1b"
    is_subnet_private = true
    sl_name           = "customer1_priv_sl"
    rt_name           = "customer1_priv_rt"
    vcn_name          = "customer1"
  }
  subnet2A = {
    display_name      = "subnet2A"
    cidr_block        = "11.0.1.0/24"
    dns_label         = "subnet2a"
    is_subnet_private = false
    sl_name           = "customer2_pub_sl"
    rt_name           = "customer2_pub_rt"
    vcn_name          = "customer2"
  }
  subnet2B = {
    display_name      = "subnet2B"
    cidr_block        = "11.0.2.0/24"
    dns_label         = "subnet1b"
    is_subnet_private = true
    sl_name           = "customer2_priv_sl"
    rt_name           = "customer2_priv_rt"
    vcn_name          = "customer2"
  }
}

lpg_params = {}

drg_params = {
  customer1_drg = {
    name     = "customer1_drg"
    vcn_name = "customer1"
    cidr_rt  = "13.0.0.0/24"
    rt_names = ["customer1_priv_rt"]
  }
  customer2_drg = {
    name     = "customer2_drg"
    vcn_name = "customer2"
    cidr_rt  = "12.0.0.0/24"
    rt_names = ["customer2_priv_rt"]
  }
}




#------------ Compute --------------
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
  customer1a = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "customer1a"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "sandbox"
    subnet_name          = "subnet1A"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "customer1",
      "department" : "customer1"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  customer1b = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "customer1b"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "subnet1B"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "customer1",
      "department" : "customer1"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  customer2a = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "customer2a"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = true
    compartment_name     = "sandbox"
    subnet_name          = "subnet2A"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "customer2",
      "department" : "customer2"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  customer2b = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "customer2b"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "subnet2B"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "customer1",
      "department" : "customer1"
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
  cust1db = {
    compartment_name        = "sandbox"
    ad                      = 1
    cpu_core_count          = 2
    db_edition              = "ENTERPRISE_EDITION"
    db_name                 = "cust1db"
    db_admin_password       = "BEstrO0ng_#11"
    db_workload             = "OLTP"
    pdb_name                = "cust1pdb"
    enable_auto_backup      = true
    db_version              = "12.1.0.2"
    display_name            = "customer1db"
    disk_redundancy         = "HIGH"
    shape                   = "VM.Standard2.8"
    subnet_name             = "subnet1B"
    ssh_public_key          = "/root/.ssh/id_rsa.pub"
    hostname                = "cust1db"
    data_storage_size_in_gb = 256
    license_model           = "BRING_YOUR_OWN_LICENSE"
    node_count              = 1
  }
  cust2db = {
    compartment_name        = "sandbox"
    ad                      = 1
    cpu_core_count          = 2
    db_edition              = "ENTERPRISE_EDITION"
    db_name                 = "cust2db"
    db_admin_password       = "BEstrO0ng_#11"
    db_workload             = "OLTP"
    pdb_name                = "cust2pdb"
    enable_auto_backup      = true
    db_version              = "12.1.0.2"
    display_name            = "customer2db"
    disk_redundancy         = "NORMAL"
    shape                   = "VM.Standard2.8"
    subnet_name             = "subnet2B"
    ssh_public_key          = "/root/.ssh/id_rsa.pub"
    hostname                = "cust2db"
    data_storage_size_in_gb = 256
    license_model           = "BRING_YOUR_OWN_LICENSE"
    node_count              = 1
  }
}



lb_params = {
  customer1lb = {
    shape            = "100Mbps"
    compartment_name = "sandbox"
    subnet_names     = ["subnet1A"]
    display_name     = "customer1lb"
    is_private       = false
    shape_details    = []
  }
  customer2lb = {
    shape            = "100Mbps"
    compartment_name = "sandbox"
    subnet_names     = ["subnet2A"]
    display_name     = "customer2lb"
    is_private       = false
    shape_details    = []
  }
}

backend_sets = {
  customer1bs = {
    name        = "customer1bs"
    lb_name     = "customer1lb"
    policy      = "ROUND_ROBIN"
    hc_port     = 80
    hc_protocol = "HTTP"
    hc_url      = "/"
  }
  customer2bs = {
    name        = "customer2bs"
    lb_name     = "customer2lb"
    policy      = "ROUND_ROBIN"
    hc_port     = 80
    hc_protocol = "HTTP"
    hc_url      = "/"
  }
}

listeners = {
  customer1list = {
    lb_name          = "customer1lb"
    name             = "customer1list"
    backend_set_name = "customer1bs"
    port             = 80
    protocol         = "HTTP"
    ssl              = []
  }
  customer2list = {
    lb_name          = "customer2lb"
    name             = "customer2list"
    backend_set_name = "customer2bs"
    port             = 80
    protocol         = "HTTP"
    ssl              = []
  }
}

backend_params = {
  cust1bsA = {
    backendset_name = "customer1bs"
    use_instance    = true
    instance_name   = "customer1a"
    lb_name         = "customer1lb"
    port            = 80
    lb_backend_name = ""
  }
  cust1bsB = {
    backendset_name = "customer1bs"
    use_instance    = true
    instance_name   = "customer1b"
    lb_name         = "customer1lb"
    port            = 80
    lb_backend_name = ""
  }
  cust2bsA = {
    backendset_name = "customer2bs"
    use_instance    = true
    instance_name   = "customer2a"
    lb_name         = "customer2lb"
    port            = 80
    lb_backend_name = ""
  }
  cust2bsB = {
    backendset_name = "customer2bs"
    use_instance    = true
    instance_name   = "customer2b"
    lb_name         = "customer2lb"
    port            = 80
    lb_backend_name = ""
  }
}

certificates = {}

ipsec_params = {
  ipsec_customer1 = {
    comp_name      = "sandbox"
    cpe_ip_address = "140.238.211.235"
    name           = "ipsec_customer1"
    drg_name       = "customer1_drg"
    static_routes  = ["10.0.0.0/24"]
  }
  ipsec_customer2 = {
    comp_name      = "sandbox"
    cpe_ip_address = "140.238.211.235"
    name           = "ipsec_customer2"
    drg_name       = "customer2_drg"
    static_routes  = ["11.0.0.0/24"]
  }
}


cc_group = {
  ccgrp1 = {
    comp_name = "sandbox"
    name      = "ccgrp1"
  }
}
cc = {
  cc1 = {
    comp_name             = "sandbox"
    name                  = "cc1"
    cc_group_name         = "ccgrp1"
    location_name         = "Chandler"
    port_speed_shape_name = "10Gbps"
  }
}

private_vc_no_provider = {
  priv_vc_no_provider = {
    comp_name             = "sandbox"
    name                  = "priv_vc_no_provider"
    type                  = "PRIVATE"
    bw_shape              = "10Gbps"
    cc_group_name         = "ccgrp1"
    cust_bgp_peering_ip   = "10.0.0.18/31"
    oracle_bgp_peering_ip = "10.0.0.18/31"
    vlan                  = "200"
    drg                   = "customerB_drg"
  }
}
private_vc_with_provider = {}
public_vc_no_provider    = {}
public_vc_with_provider  = {}

kms_key_ids = {}
