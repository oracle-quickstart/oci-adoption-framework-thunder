// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartment_ids = {
  sandbox = "ocid1..."
}

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
    subnet_name         = ""
  }
  hurriadw = {
    compartment_name    = "sandbox"
    cpu_core_count      = 1
    size_in_tbs         = 1
    db_name             = "hurriadw"
    db_workload         = "DW"
    enable_auto_scaling = false
    is_free_tier        = false
    create_local_wallet = false
    subnet_name         = ""
  }
}
