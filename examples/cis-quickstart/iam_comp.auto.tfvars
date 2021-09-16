// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

##########Variabila de sters

parent_comp = {
  g = {
    "name" = "g"
    "id"   = "ocid1.compartment.oc1..aaaaaaaayspffvihh6n3n7mcrgukjdgbnx4dnfdlc2czloijiyzyqjov5a7q"
  }
}

# parent_comp = {}
user_params = {}
# group_params  = {}
policy_params = {}
#####Modificat enable delete pe false
comp_params = {
  lz-top-cmp = {
    name          = "lz-top-cmp"
    description   = "The lz-top-cmp compartment will be created under tenancy and will include all the other resources."
    enable_delete = true
    parent_name   = "g"
  }
}

comp_params2 = {
  lz-security-cmp = {
    name          = "lz-security-cmp"
    description   = "Landing Zone compartment for all security related resources: vaults, topics, notifications, logging, scanning, and others."
    enable_delete = true
    parent_name   = "lz-top-cmp"

  },
  lz-network-cmp = {
    name          = "lz-network-cmp"
    description   = "Landing Zone compartment for all network related resources: VCNs, subnets, network gateways, security lists, NSGs, load balancers, VNICs, and others."
    enable_delete = true
    parent_name   = "lz-top-cmp"
  },
  lz-appdev-cmp = {
    name          = "lz-appdev-cmp"
    description   = "Landing Zone compartment for all resources related to application development: compute instances, storage, functions, OKE, API Gateway, streaming, and others."
    enable_delete = true
    parent_name   = "lz-top-cmp"
  },
  lz-database-cmp = {
    name          = "lz-database-cmp"
    description   = "Landing Zone compartment for all database related resources."
    enable_delete = true
    parent_name   = "lz-top-cmp"
  },
}
