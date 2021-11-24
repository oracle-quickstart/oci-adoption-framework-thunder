// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


cloud_guard_config = {
  cg_config = {
    comp_name             = "tenancy"
    status                = "ENABLED"
    self_manage_resources = false
    region_name           = "us-ashburn-1"
  }
}


cloud_guard_target = {
  lz-cloud-guard-root-target = {
    display_name = "lz-cloud-guard-root-target"
    comp_name    = "tenancy"
    target_name  = "tenancy"
    target_type  = "COMPARTMENT"
  }
}
