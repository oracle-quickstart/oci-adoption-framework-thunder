// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

vcn_params = {
  lz-0-vcn = {
    compartment_name = "lz-network-cmp"
    display_name     = "lz-0-vcn"
    vcn_cidr         = "10.0.0.0/20"
    dns_label        = "lz0vcn"
  }
}

igw_params = {
  lz-0-vcn-igw = {
    display_name = "lz-0-vcn-igw"
    vcn_name     = "lz-0-vcn"
  }

}

ngw_params = {
  lz-0-vcn-natgw = {
    display_name = "lz-0-vcn-natgw"
    vcn_name     = "lz-0-vcn"
  }
}

sgw_params = {
  lz-0-vcn-sgw = {
    display_name = "lz-0-vcn-sgw"
    vcn_name     = "lz-0-vcn"
    service_name = "All IAD Services In Oracle Services Network"
  }
}



rt_params = {
  lz-0-web-rtable = {
    display_name = "lz-0-web-rtable"
    vcn_name     = "lz-0-vcn"

    route_rules = [
      {
        destination = "0.0.0.0/0"
        use_sgw     = false
        sgw_name    = null
        use_igw     = true
        igw_name    = "lz-0-vcn-igw"
        ngw_name    = null
      },
    ]
  },
  lz-0-app-rtable = {
    display_name = "lz-0-app-rtable"
    vcn_name     = "lz-0-vcn"

    route_rules = [
      {
        destination = "all-fra-services-in-oracle-services-network"
        use_sgw     = true
        sgw_name    = "lz-0-vcn-sgw"
        use_igw     = false
        igw_name    = null
        ngw_name    = null
      },
      {
        destination = "0.0.0.0/0"
        use_sgw     = false
        sgw_name    = null
        use_igw     = false
        igw_name    = null
        ngw_name    = "lz-0-vcn-natgw"
      },

    ]
  },
  lz-0-db-rtable = {
    display_name = "lz-0-db-rtable"
    vcn_name     = "lz-0-vcn"

    route_rules = [
      {
        destination = "all-fra-services-in-oracle-services-network"
        use_sgw     = true
        sgw_name    = "lz-0-vcn-sgw"
        use_igw     = false
        igw_name    = null
        ngw_name    = null
      }
    ]
  }
}

sl_params = {
  lz-0-web-sl = {
    vcn_name     = "lz-0-vcn"
    display_name = "lz-0-web-sl"

    egress_rules = [
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.0.0.0/20" # this should be set to a cidr range from where you want to access your vcn on port 22
        source_type = "CIDR_BLOCK"
        tcp_options = [
          {
            min = "22"
            max = "22"
        }, ]
        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.0.0.0/20" # this should be set to a cidr range from where you want to access your vcn on port 3389
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "3389"
            max = "3389"
          },
        ]

        udp_options = []
      }
    ]
  },
  lz-0-app-sl = {
    vcn_name     = "lz-0-vcn"
    display_name = "lz-0-app-sl"

    egress_rules = [
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.0.0.0/20" # this should be set to a cidr range from where you want to access your vcn on port 22
        source_type = "CIDR_BLOCK"
        tcp_options = [
          {
            min = "22"
            max = "22"
        }, ]
        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.0.0.0/20" # this should be set to a cidr range from where you want to access your vcn on port 3389
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "3389"
            max = "3389"
          },
        ]

        udp_options = []
      }
    ]
  },
  lz-0-db-sl = {
    vcn_name     = "lz-0-vcn"
    display_name = "lz-0-db-sl"

    egress_rules = [
    ]

    ingress_rules = [
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.0.0.0/20" # this should be set to a cidr range from where you want to access your vcn on port 22
        source_type = "CIDR_BLOCK"
        tcp_options = [
          {
            min = "22"
            max = "22"
        }, ]
        udp_options = []
      },
      {
        stateless   = "false"
        protocol    = "6"
        source      = "10.0.0.0/20" # this should be set to a cidr range from where you want to access your vcn on port 3389
        source_type = "CIDR_BLOCK"

        tcp_options = [
          {
            min = "3389"
            max = "3389"
          },
        ]

        udp_options = []
      }
    ]
  },

}


subnet_params = {
  lz-0-web-subnet = {
    display_name      = "lz-0-web-subnet"
    cidr_block        = "10.0.0.0/24"
    dns_label         = "web"
    is_subnet_private = false
    sl_name           = "lz-0-web-sl"
    rt_name           = "lz-0-web-rtable"
    vcn_name          = "lz-0-vcn"
  }
  lz-0-app-subnet = {
    display_name      = "lz-0-app-subnet"
    cidr_block        = "10.0.1.0/24"
    dns_label         = "app"
    is_subnet_private = true
    sl_name           = "lz-0-app-sl"
    rt_name           = "lz-0-app-rtable"
    vcn_name          = "lz-0-vcn"
  }
  lz-0-db-subnet = {
    display_name      = "lz-0-db-subnet"
    cidr_block        = "10.0.2.0/24"
    dns_label         = "db"
    is_subnet_private = true
    sl_name           = "lz-0-db-sl"
    rt_name           = "lz-0-db-rtable"
    vcn_name          = "lz-0-vcn"
  }
}


nsg_params = {
  lz-0-vcn-bastion-nsg = {
    display_name = "lz-0-vcn-bastion-nsg"
    vcn_name     = "lz-0-vcn"
  },
  lz-0-vcn-lbr-nsg = {
    display_name = "lz-0-vcn-lbr-nsg"
    vcn_name     = "lz-0-vcn"
  },
  lz-0-vcn-app-nsg = {
    display_name = "lz-0-vcn-app-nsg"
    vcn_name     = "lz-0-vcn"
  },
  lz-0-vcn-db-nsg = {
    display_name = "lz-0-vcn-db-nsg"
    vcn_name     = "lz-0-vcn"
  }
}




nsg_rules_params = {
  lbr-nsg-ssh-ingress = {
    nsg_name         = "lz-0-vcn-lbr-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "INGRESS"
    source           = "lz-0-vcn-bastion-nsg"
    source_type      = "NETWORK_SECURITY_GROUP"
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
  },
  app-nsg-ssh-ingress = {
    nsg_name         = "lz-0-vcn-app-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "INGRESS"
    source           = "lz-0-vcn-bastion-nsg"
    source_type      = "NETWORK_SECURITY_GROUP"
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
  },
  app-nsg-http-ingress = {
    nsg_name         = "lz-0-vcn-app-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "INGRESS"
    source           = "lz-0-vcn-lbr-nsg"
    source_type      = "NETWORK_SECURITY_GROUP"
    destination      = null
    destination_type = null
    tcp_options = [
      {
        destination_ports = [
          {
            min = 80
            max = 80
          }
        ],
        source_ports = []
      }
    ]
    udp_options = []
  },
  db-nsg-ssh-ingress = {
    nsg_name         = "lz-0-vcn-db-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "INGRESS"
    source           = "lz-0-vcn-bastion-nsg"
    source_type      = "NETWORK_SECURITY_GROUP"
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
  },
  db-nsg-app-ingress = {
    nsg_name         = "lz-0-vcn-db-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "INGRESS"
    source           = "lz-0-vcn-app-nsg"
    source_type      = "NETWORK_SECURITY_GROUP"
    destination      = null
    destination_type = null
    tcp_options = [
      {
        destination_ports = [
          {
            min = 1521
            max = 1522
          }
        ],
        source_ports = []
      }
    ]
    udp_options = []
  },


  bst-nsg-app-egress = {
    nsg_name         = "lz-0-vcn-bastion-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "lz-0-vcn-app-nsg"
    destination_type = "NETWORK_SECURITY_GROUP"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
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
  },
  bst-nsg-db-egress = {
    nsg_name         = "lz-0-vcn-bastion-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "lz-0-vcn-db-nsg"
    destination_type = "NETWORK_SECURITY_GROUP"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
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
  },
  bst-nsg-lbr-egress = {
    nsg_name         = "lz-0-vcn-bastion-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "lz-0-vcn-lbr-nsg"
    destination_type = "NETWORK_SECURITY_GROUP"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
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
  },
  bst-nsg-osn-services-egress = {
    nsg_name         = "lz-0-vcn-bastion-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "all-fra-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
      {
        source_ports = [
          {
            min = 443
            max = 443
          }
        ],
        destination_ports = []
      }
    ]
  },
  lbr-nsg-app-egress = {
    nsg_name         = "lz-0-vcn-lbr-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "lz-0-vcn-app-nsg"
    destination_type = "NETWORK_SECURITY_GROUP"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
      {
        source_ports = [
          {
            min = 80
            max = 80
          }
        ],
        destination_ports = []
      }
    ]
  },
  lbr-nsg-osn-services-egress = {
    nsg_name         = "lz-0-vcn-lbr-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "all-fra-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
      {
        source_ports = [
          {
            min = 443
            max = 443
          }
        ],
        destination_ports = []
      }
    ]
  },
  app-nsg-db-egress = {
    nsg_name         = "lz-0-vcn-app-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "lz-0-vcn-db-nsg"
    destination_type = "NETWORK_SECURITY_GROUP"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
      {
        source_ports = [
          {
            min = 1521
            max = 1522
          }
        ],
        destination_ports = []
      }
    ]
  },
  app-nsg-osn-services-egress = {
    nsg_name         = "lz-0-vcn-app-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "all-fra-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
      {
        source_ports = [
          {
            min = 443
            max = 443
          }
        ],
        destination_ports = []
      }
    ]
  },
  db-nsg-osn-services-egress = {
    nsg_name         = "lz-0-vcn-db-nsg"
    protocol         = "6"
    stateless        = "false"
    direction        = "EGRESS"
    destination      = "all-fra-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    source           = null
    source_type      = null
    udp_options      = []
    tcp_options = [
      {
        source_ports = [
          {
            min = 443
            max = 443
          }
        ],
        destination_ports = []
      }
    ]
  }
}

lpg_params = {}

drg_params = {}
