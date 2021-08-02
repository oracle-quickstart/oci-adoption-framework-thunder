// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#----------- IAM Resources --------
comp_params = {
  sandbox = {
    name          = "sandbox"
    description   = "The sandbox compartment contains crawl, walk, run resources for the framework including IAM."
    enable_delete = false
  }
  test_comp = {
    name          = "test_comp"
    description   = "this is the IFS compartment"
    enable_delete = false
  }
}

user_params = {
  Root_IAMAdmin = {
    name        = "Root_IAMAdmin"
    description = "User allowed to modify the Administrators and NetSecAdmins group"
    group_name  = "Root_IAMAdminManagers.grp"
  }
  User_IAMManager = {
    name        = "User_IAMManager"
    description = "User allowed to modify all users groups except the Administrators and NetSecAdmin group."
    group_name  = "User_IAMManagers.grp"
  }
  Tenancy_NetSecAdmins = {
    name        = "Tenancy_NetSecAdmins"
    description = "Network admin of security-lists, internet-gateways, cpes, ipsec-connections."
    group_name  = "Tenancy_NetSecAdmins.grp"
  }
  Tenancy_ReadOnly = {
    name        = "Tenancy_ReadOnly"
    description = "Tenancy_ReadOnly"
    group_name  = "Tenancy_ReadOnly.grp"
  }
  Sandbox_Engineer = {
    name        = "Sandbox_Engineer"
    description = "User with full access to manage resources in the sandbox compartment."
    group_name  = "Sandbox_Engineer.grp"
  }
}

group_params = {

  "Root_IAMAdminManagers.grp" = {
    name        = "Root_IAMAdminManagers.grp"
    description = "Group for users allowed to modify the Administrators and NetSecAdmins group."
  }
  "User_IAMManagers.grp" = {
    name        = "User_IAMManagers.grp"
    description = "Group for users allowed to modify all users groups except the Administrators and NetSecAdmin group."
  }
  "Tenancy_NetSecAdmins.grp" = {
    name        = "Tenancy_NetSecAdmins.grp"
    description = "Administrators of the VCN’s, but restricted from the follow resources: vcns, subnets, route-tables, dhcp-options, drgs, drg-attachments, vnics, vnic-attachments."
  }
  "Tenancy_ReadOnly.grp" = {
    name        = "Tenancy_ReadOnly.grp"
    description = "Viewing & Inspecting the tenancy configuration. Aim at Management and users in training before getting read/write access."
  }
  "Sandbox_Engineer.grp" = {
    name        = "Sandbox_Engineer.grp"
    description = "Group able to perform Engineering activities on all resources limited to the sandbox compartment."
  }
}

policy_params = {
  "Root_IAMAdminManagers.pl" = {
    name        = "Root_IAMAdminManagers.pl"
    description = "Root_IAMAdminManagers.pl"

    statements = [
      "ALLOW GROUP Root_IAMAdminManagers.grp to read users IN TENANCY",
      "ALLOW GROUP Root_IAMAdminManagers.grp to read groups IN TENANCY",
      "ALLOW GROUP Root_IAMAdminManagers.grp to manage users IN TENANCY",
      "ALLOW GROUP Root_IAMAdminManagers.grp to manage groups IN TENANCY where target.group.name = 'Administrators'",
      "ALLOW GROUP Root_IAMAdminManagers.grp to manage groups IN TENANCY where target.group.name = 'Tenancy_NetSecAdmins.grp'",
    ]
  },
  "User_IAMManagers.pl" = {
    name        = "User_IAMManagers.pl"
    description = "User_IAMManagers.pl"

    statements = [
      "ALLOW GROUP User_IAMManagers.grp to read users IN TENANCY",
      "ALLOW GROUP User_IAMManagers.grp to read groups IN TENANCY",
      "ALLOW GROUP User_IAMManagers.grp to manage users IN TENANCY",
      "ALLOW GROUP User_IAMManagers.grp to manage groups IN TENANCY where all {target.group.name ! = 'Administrators', target.group.name ! = 'Tenancy_NetSecAdmins.grp'}"
    ]
  },
  "Tenancy_NetSecAdmins.pl" = {
    name        = "Tenancy_NetSecAdmins.pl"
    description = "Tenancy_NetSecAdmins.pl"

    statements = [
      "ALLOW GROUP Tenancy_NetSecAdmins.grp to manage security-lists IN TENANCY",
      "ALLOW GROUP Tenancy_NetSecAdmins.grp to manage internet-gateways IN TENANCY",
      "ALLOW GROUP Tenancy_NetSecAdmins.grp to manage cpes IN TENANCY",
      "ALLOW GROUP Tenancy_NetSecAdmins.grp to manage ipsec-connections IN TENANCY",
      "ALLOW GROUP Tenancy_NetSecAdmins.grp to use virtual-network-family IN TENANCY",
      "ALLOW GROUP Tenancy_NetSecAdmins.grp to manage load-balancers IN TENANCY",
      "ALLOW GROUP Tenancy_NetSecAdmins.grp to read all-resources IN TENANCY",
    ]
  },
  "Tenancy_ReadOnly.pl" = {
    name        = "Tenancy_ReadOnly.pl"
    description = "Tenancy_ReadOnly.pl"

    statements = [
      "ALLOW GROUP Tenancy_ReadOnly.grp to read all-resources IN TENANCY"
    ]
  },
  "Sandbox_Engineer.pl" = {
    name        = "Sandbox_Engineer.pl"
    description = "Sandbox_Engineer.pl"

    statements = [
      "ALLOW GROUP Sandbox_Engineer.grp to manage instance-family IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to manage object-family IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to manage database-family IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to manage volume-family IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to manage virtual-network-family IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to manage app-catalog-listing IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to manage cluster-family IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to manage file-family IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to manage app-catalog-listing IN TENANCY where target.compartment.name=/sandbox/",
      "ALLOW GROUP Sandbox_Engineer.grp to read all-resources IN TENANCY"
    ]
  },
}


#-----------------------------------



#----------- Network Resources -----
vcn_params = {
  hur1 = {
    compartment_name = "sandbox"
    display_name     = "hur1"
    vcn_cidr         = "10.0.0.0/16"
    dns_label        = "hur1"
  }
  hur2 = {
    compartment_name = "sandbox"
    display_name     = "hur2"
    vcn_cidr         = "11.0.0.0/16"
    dns_label        = "hur2"
  }
}

igw_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name     = "hur1"
  },
  hurricane2 = {
    display_name = "hurricane2"
    vcn_name     = "hur2"
  }
}

ngw_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name     = "hur1"
  },
  hurricane2 = {
    display_name = "hurricane2"
    vcn_name     = "hur2"
  }
}

rt_params = {
  hurricane1pub = {
    display_name = "hurricane1pub"
    vcn_name     = "hur1"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = true
        igw_name    = "hurricane1"
        ngw_name    = null
      },
    ]
  },
  hurricane1priv = {
    display_name = "hurricane1priv"
    vcn_name     = "hur1"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = false
        igw_name    = null
        ngw_name    = "hurricane1"
      },
    ]
  },
  hurricane2pub = {
    display_name = "hurricane2pub"
    vcn_name     = "hur2"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = true
        ngw_name    = null
        igw_name    = "hurricane2"
      },
    ]
  },
  hurricane2priv = {
    display_name = "hurricane2priv"
    vcn_name     = "hur2"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_igw     = false
        ngw_name    = "hurricane2"
        igw_name    = null
      },
    ]
  }
}

sl_params = {
  Hurricane1 = {
    vcn_name     = "hur1"
    display_name = "Hurricane1"

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
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.4.0.0/16"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "80"
            max = "80"
          },
        ]

        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "17"
        source      = "10.4.0.0/16"
        source_type = "CIDR_BLOCK"

        tcp_options = []

        udp_options = [
          {
            min = "80"
            max = "80"
          },
        ]
      },
    ]
  }
  Hurricane2 = {
    vcn_name     = "hur2"
    display_name = "Hurricane2"

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
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.4.0.0/16"
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "80"
            max = "80"
          },
        ]

        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "17"
        source      = "10.4.0.0/16"
        source_type = "CIDR_BLOCK"

        tcp_options = []

        udp_options = [
          {
            min = "80"
            max = "80"
          },
        ]
      },
    ]
  },
}



nsg_params = {
  hurricane1 = {
    display_name = "hurricane1"
    vcn_name     = "hur1"
  },
  hurricane2 = {
    display_name = "hurricane2"
    vcn_name     = "hur2"
  }
}

nsg_rules_params = {
  hurricane1 = {
    nsg_name         = "hurricane1"
    protocol         = "6"
    stateless        = "false"
    direction        = "INGRESS"
    source           = "11.0.0.0/16"
    source_type      = "CIDR_BLOCK"
    destination      = null
    destination_type = null
    tcp_options = [
      {
        destination_ports = [
          {
            min = 22
            max = 22
          }
        ],
        source_ports = []
      }
    ]
    udp_options = []
  }
  hurricane2 = {
    nsg_name         = "hurricane2"
    protocol         = "17"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "10.0.0.0/16"
    destination_type = "CIDR_BLOCK"
    source           = null
    source_type      = null
    udp_options = [
      {
        source_ports = [
          {
            min = 22
            max = 22
          }
        ],
        destination_ports = []
      }
    ]
    tcp_options = []
  }
}


subnet_params = {
  hur1pub = {
    display_name      = "hur1pub"
    cidr_block        = "10.0.1.0/24"
    dns_label         = "hur1pub"
    is_subnet_private = false
    sl_name           = "Hurricane1"
    rt_name           = "hurricane1pub"
    vcn_name          = "hur1"
  }
  hur1priv = {
    display_name      = "hur1priv"
    cidr_block        = "10.0.2.0/24"
    dns_label         = "hur1priv"
    is_subnet_private = true
    sl_name           = "Hurricane1"
    rt_name           = "hurricane1priv"
    vcn_name          = "hur1"
  }
  hur2pub = {
    display_name      = "hur2pub"
    cidr_block        = "11.0.1.0/24"
    dns_label         = "hur2pub"
    is_subnet_private = false
    sl_name           = "Hurricane2"
    rt_name           = "hurricane2pub"
    vcn_name          = "hur2"
  }
  hur2priv = {
    display_name      = "hur2priv"
    cidr_block        = "11.0.2.0/24"
    dns_label         = "hur2priv"
    is_subnet_private = true
    sl_name           = "Hurricane2"
    rt_name           = "hurricane2priv"
    vcn_name          = "hur2"
  }
}

lpg_params = {
  lpg12 = {
    requestor    = "hur1"
    acceptor     = "hur2"
    display_name = "lpg12"
  }
}

drg_params = {}
#-----------------------------------


#------------- ADW/ATP -------------
adw_params = {
  hurriatp = {
    compartment_name    = "sandbox"
    cpu_core_count      = 1
    size_in_tbs         = 1
    db_name             = "hurriatp"
    db_workload         = "OLTP"
    enable_auto_scaling = false
    is_free_tier        = false
    create_local_wallet = true
  }
  hurriadw = {
    compartment_name    = "sandbox"
    cpu_core_count      = 1
    size_in_tbs         = 1
    db_name             = "hurriadw"
    db_workload         = "DW"
    enable_auto_scaling = false
    is_free_tier        = false
    create_local_wallet = true
  }
}
#-----------------------------------



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
    kms_key_name = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = true
    fd                 = 1
    image_version      = "oel7"
    nsgs               = []
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
    subnet_name          = "hur1priv"
    ssh_public_key       = "/root/.ssh/id_rsa.pub"
    device_disk_mappings = "/u01:/dev/oracleoci/oraclevdb"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = true
    fd                 = 1
    image_version      = "oel7"
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
    performance        = "Balanced"
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
    encrypt_in_transit = true 
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
    encrypt_in_transit = true 
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
    encrypt_in_transit = true 
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
    encrypt_in_transit = true 
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
    encrypt_in_transit = true 
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
    device_disk_mappings = "D:50GB E:60GB F:70GB"
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
    kms_key_name = ""
    block_vol_att_type = "paravirtualized"
    encrypt_in_transit = false
    enable_admin       = "yes"
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
    bv_size       = 70
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
}
#-----------------------------------

#-------------- DBaaS --------------
database_params = {
  hur1db = {
    compartment_name        = "sandbox"
    ad                      = 1
    cpu_core_count          = 2
    db_edition              = "ENTERPRISE_EDITION"
    db_name                 = "hur1db"
    db_admin_password       = "BEstrO0ng_#11"
    db_workload             = "OLTP"
    pdb_name                = "hur1pdb"
    enable_auto_backup      = true
    db_version              = "12.1.0.2"
    display_name            = "hur1"
    disk_redundancy         = "HIGH"
    shape                   = "VM.Standard2.8"
    subnet_name             = "hur1pub"
    ssh_public_key          = "/root/.ssh/id_rsa.pub"
    hostname                = "hur1"
    data_storage_size_in_gb = 256
    license_model           = "BRING_YOUR_OWN_LICENSE"
    node_count              = 1
  }
  hur2db = {
    compartment_name        = "sandbox"
    ad                      = 1
    cpu_core_count          = 2
    db_edition              = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
    db_name                 = "hur2db"
    db_admin_password       = "BEstrO0ng_#11"
    db_workload             = "OLTP"
    pdb_name                = "hur2pdb"
    enable_auto_backup      = true
    db_version              = "12.1.0.2"
    display_name            = "hur2"
    disk_redundancy         = "NORMAL"
    shape                   = "VM.Standard2.8"
    subnet_name             = "hur1pub"
    ssh_public_key          = "/root/.ssh/id_rsa.pub"
    hostname                = "hur2"
    data_storage_size_in_gb = 256
    license_model           = "BRING_YOUR_OWN_LICENSE"
    node_count              = 1
  }
}

fss_params = {
  thunder1 = {
    ad               = 1
    compartment_name = "sandbox"
    name             = "thunder1"
    kms_key_name     = ""
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
        source   = "10.0.1.0/24"
        access   = "READ_WRITE"
        identity = "ROOT"
        use_port = true
      }
    ]
  }
}

instance_principal_params = {
  web = {
    dg_description     = "instance principal web"
    dg_name            = "web"
    policy_description = "web"
    policy_name        = "web"
    instance_name      = "hur1"
  }
}

lb_params = {
  "hur-lb" = {
    shape            = "100Mbps"
    compartment_name = "sandbox"
    subnet_names     = ["hur1pub"]
    display_name     = "hur-lb"
    is_private       = false
    shape_details = []
  }
}

backend_sets = {
  "hur1-bs" = {
    name        = "hur1-bs"
    lb_name     = "hur-lb"
    policy      = "ROUND_ROBIN"
    hc_port     = 80
    hc_protocol = "HTTP"
    hc_url      = "/"
  }
}

listeners = {
  "hur-list" = {
    lb_name          = "hur-lb"
    name             = "hur-list"
    backend_set_name = "hur1-bs"
    port             = 80
    protocol         = "HTTP"
    ssl              = []
  }
}

backend_params = {
  "hur1-bs" = {
    backendset_name = "hur1-bs"
    use_instance    = true
    instance_name   = "hur1"
    lb_name         = "hur-lb"
    port            = 80
    lb_backend_name = ""
  }
  "hur2-bs" = {
    backendset_name = "hur1-bs"
    use_instance    = true
    instance_name   = "win01"
    lb_name         = "hur-lb"
    port            = 80
    lb_backend_name = ""
  }
}

certificates = {}

bucket_params = {
  "hur-buck-1" = {
    compartment_name = "sandbox"
    name             = "hur-buck-1"
    access_type      = "NoPublicAccess"
    storage_tier     = "Standard"
    events_enabled   = false
    kms_key_name     = ""
  }
}

zone_params = {
  "hur1.com" = {
    compartment_name = "sandbox"
    zone_name        = "hur1.com"
    zone_type        = "PRIMARY"
    external_masters = []
  }
  "hur2.com" = {
    compartment_name = "sandbox"
    zone_name        = "hur2.com"
    zone_type        = "SECONDARY"
    external_masters = [
      {
        ip = "2.2.2.2"
      },
      {
        ip = "1.1.1.1"
      },
    ]
  }
}

dns_records_params = {
  "primary1.hur1.com" = {
    zone_name     = "hur1.com"
    domain        = "primary1.hur1.com"
    rtype         = "A"

    dns_items = [
    {
      domain        = "primary1.hur1.com"
      ttl           = 300
      rdata         = null
      rtype         = "A"
      use_instance  = true
      instance_name = "hur1"
      use_lb        = null
      lb_name       = null
    },
    ]
  }
  "primary2.hur1.com" = {
    zone_name     = "hur1.com"
    domain        = "primary2.hur1.com"
    rtype         = "A"
    dns_items = [
      {
        domain        = "primary2.hur1.com"
        ttl           = 300
        rdata         = null
        rtype         = "A"
        use_instance  = false
        instance_name = null
        use_lb        = true
        lb_name       = "hur-lb"
      },
    ]
  }
  "primary3.hur1.com" = {
    zone_name     = "hur1.com"
    domain        = "primary3.hur1.com"
    rtype         = "A"

    dns_items = [
      {
      domain        = "primary3.hur1.com"
      ttl           = 300
      rdata         = "1.1.1.1"
      rtype         = "A"
      use_instance  = false
      instance_name = null
      use_lb        = false
      lb_name       = null
      },
    ]
  }
}

kms_key_ids = {}
