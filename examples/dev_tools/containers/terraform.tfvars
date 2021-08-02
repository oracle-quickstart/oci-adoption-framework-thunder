// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
compartment_ids = {
   db_rampup = "ocid1...."
}

subnet_ids = {
  IPSEC2     = "ocid1...."
  okesubnet1 = "ocid1...."
  okesubnet2 = "ocid1...."
  okesubnet3 = "ocid1...."
}

vcn_ids = {
  IPSEC2 = "ocid1...."
}

cluster_params = {
  cluster1 = {
    compartment_name                = "db_rampup"
    cluster_name                    = "cluster1"
    kubernetes_version              = "v1.15.7"
    use_encryption                  = false
    kms_key_id                      = ""
    vcn_name                        = "IPSEC2"
    is_kubernetes_dashboard_enabled = true
    is_tiller_enabled               = true
    pods_cidr                       = "10.244.0.0/16"
    services_cidr                   = "10.96.0.0/16"
    service_lb_subnet_names         = ["IPSEC2"]
  }
}

nodepools_params = {
  pool1 = {
    compartment_name = "db_rampup"
    cluster_name     = "cluster1"
    pool_name        = "pool1"
    subnet_name      = "okesubnet1"
    size             = 3
    node_shape       = "VM.Standard2.1"
    ssh_public_key   = "/root/.ssh/id_rsa.pub"
    placement_configs = [
      {
        ad     = 1
        subnet = "IPSEC2"
      },
      {
        ad     = 1
        subnet = "IPSEC2"
      },
      {
        ad     = 1
        subnet = "IPSEC2"
      },
    ]
  }
  pool2 = {
    compartment_name = "db_rampup"
    cluster_name     = "cluster1"
    pool_name        = "pool2"
    subnet_name      = "okesubnet2"
    size             = 3
    node_shape       = "VM.Standard2.1"
    ssh_public_key   = "/root/.ssh/id_rsa.pub"
    placement_configs = [
      {
        ad     = 1
        subnet = "IPSEC2"
      },
    ]
  }
  pool3 = {
    compartment_name = "db_rampup"
    cluster_name     = "cluster1"
    pool_name        = "pool3"
    subnet_name      = "okesubnet3"
    size             = 3
    node_shape       = "VM.Standard2.1"
    ssh_public_key   = "/root/.ssh/id_rsa.pub"
    placement_configs = [
      {
        ad     = 1
        subnet = "IPSEC2"
      },
    ]
 }
}

linux_images = {
  # Oracle-Linux-7.7-2021.02.21-0
  # from https://docs.cloud.oracle.com/en-us/iaas/images/image/957e74db-0375-4918-b897-a8ce93753ad9/
  ap-melbourne-1  = "ocid1...."
  ap-mumbai-1     = "ocid1...."
  ap-osaka-1      = "ocid1...."
  ap-seoul-1      = "ocid1...."
  ap-sydney-1     = "ocid1...."
  ap-tokyo-1      = "ocid1...."
  ca-montreal-1   = "ocid1...."
  ca-toronto-1    = "ocid1...."
  eu-amsterdam-1  = "ocid1...."
  eu-frankfurt-1  = "ocid1...."
  eu-zurich-1     = "ocid1...."
  me-jeddah-1     = "ocid1...."
  sa-saopaulo-1   = "ocid1...."
  uk-gov-london-1 = "ocid1...."
  uk-london-1     = "ocid1...."
  us-ashburn-1    = "ocid1...."
  us-langley-1    = "ocid1...."
  us-luke-1       = "ocid1...."
  us-phoenix-1    = "ocid1...."
}
