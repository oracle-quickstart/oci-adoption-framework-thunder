// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartment_ids = {
  sandbox = "ocid1...."
}

vcn_params = {
  mgmt_vcn = {
    compartment_name = "sandbox"
    display_name     = "mgmt_vcn"
    vcn_cidr         = "10.0.0.0/16"
    dns_label        = "mgmtvcn"
  }
  customerA_vcn = {
    compartment_name = "sandbox"
    display_name     = "customerA_vcn"
    vcn_cidr         = "10.10.0.0/16"
    dns_label        = "customeravcn"
  }
  customerB_vcn = {
    compartment_name = "sandbox"
    display_name     = "customerB_vcn"
    vcn_cidr         = "10.20.0.0/16"
    dns_label        = "customerbvcn"
  }

}

igw_params = {}

ngw_params = {}

rt_params = {
  mgmt_rt = {
    display_name = "mgmt_rt"
    vcn_name     = "mgmt_vcn"
    route_rules  = []
  }

  customerA_rt = {
    display_name = "customerA_rt"
    vcn_name     = "customerA_vcn"
    route_rules  = []
  }

  customerB_rt = {
    display_name = "customerB_rt"
    vcn_name     = "customerB_vcn"
    route_rules  = []
  }
}

sl_params = {
  mgmt_sl = {
    vcn_name     = "mgmt_vcn"
    display_name = "mgmt_sl"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      },
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        tcp_options = []
        udp_options = []
      }
    ]
  }
  customerA_sl = {
    vcn_name     = "customerA_vcn"
    display_name = "customerA_sl"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      },
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
  customerB_sl = {
    vcn_name     = "customerB_vcn"
    display_name = "customerB_sl"

    egress_rules = [
      {
        stateless   = "false"
        protocol    = "all"
        destination = "0.0.0.0/0"
      },
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
  sharedsubnet = {
    display_name      = "sharedsubnet"
    cidr_block        = "10.0.0.0/24"
    dns_label         = "sharedsubnet"
    is_subnet_private = false
    sl_name           = "mgmt_sl"
    rt_name           = "mgmt_rt"
    vcn_name          = "mgmt_vcn"
  }
  appsubneta = {
    display_name      = "appsubneta"
    cidr_block        = "10.10.0.0/24"
    dns_label         = "appsubneta"
    is_subnet_private = true
    sl_name           = "customerA_sl"
    rt_name           = "customerA_rt"
    vcn_name          = "customerA_vcn"
  }
  appsubnetb = {
    display_name      = "appsubnetb"
    cidr_block        = "10.20.0.0/24"
    dns_label         = "appsubnetb"
    is_subnet_private = true
    sl_name           = "customerB_sl"
    rt_name           = "customerB_rt"
    vcn_name          = "customerB_vcn"
  }
}

lpg_params = {
  mgmt_to_a = {
    requestor    = "mgmt_vcn"
    acceptor     = "customerA_vcn"
    display_name = "mgmt_to_a"
  }
  mgmt_to_b = {
    requestor    = "mgmt_vcn"
    acceptor     = "customerB_vcn"
    display_name = "mgmt_to_b"
  }
}

drg_params = {
  mgmt_drg = {
    name     = "mgmt_drg"
    vcn_name = "mgmt_vcn"
    cidr_rt  = "192.0.0.0/16"
    rt_names = ["mgmt_rt"]
  }
  customerA_drg = {
    name     = "customerA_drg"
    vcn_name = "customerA_vcn"
    cidr_rt  = "192.10.0.0/16"
    rt_names = ["customerA_rt"]
  }
  customerB_drg = {
    name     = "customerB_drg"
    vcn_name = "customerB_vcn"
    cidr_rt  = "192.20.0.0/16"
    rt_names = ["customerB_rt"]
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
  mgmt1 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "mgmt1"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "sharedsubnet"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "mgmt",
      "department" : "mgmt"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  mgmt2 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "mgmt2"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "sharedsubnet"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "mgmt",
      "department" : "mgmt"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  ca1 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "ca1"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "appsubneta"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "customer a",
      "department" : "customer a"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  ca2 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "ca2"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "appsubneta"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "customer a",
      "department" : "customer a"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  cb1 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "cb1"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "appsubnetb"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "customer b",
      "department" : "customer b"
    }
    kms_key_name       = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
  }
  cb2 = {
    ad                   = 1
    shape                = "VM.Standard2.1"
    hostname             = "cb2"
    boot_volume_size     = 120
    preserve_boot_volume = false
    assign_public_ip     = false
    compartment_name     = "sandbox"
    subnet_name          = "appsubnetb"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = ""
    freeform_tags = {
      "client" : "customer b",
      "department" : "customer b"
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

ipsec_params = {
  ipsec_customer_a = {
    comp_name      = "sandbox"
    cpe_ip_address = "140.238.211.235"
    name           = "ipsec_customer_a"
    drg_name       = "customerA_drg"
    static_routes  = ["10.20.0.0/24"]
  }
  ipsec_mgmt_vcn = {
    comp_name      = "sandbox"
    cpe_ip_address = "140.238.211.235"
    name           = "ipsec_mgmt_vcn"
    drg_name       = "mgmt_drg"
    static_routes  = ["10.0.0.0/24"]
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
