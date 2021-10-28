// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


dynamic_groups = {
  "lz-top-cmp-fun-dynamic-group" = {
    name                      = "lz-top-cmp-fun-dynamic-group"
    description               = "Landing Zone dynamic group for functions in compartment lz-top-cmp"
    resource_type             = "fnfunc"
    matching_compartment_name = "lz-top-cmp"
  },
  "lz-top-cmp-adb-dynamic-group" = {
    name                      = "lz-top-cmp-adb-dynamic-group"
    description               = "Landing Zone dynamic group for Autonomous Databases in compartment lz-top-cmp"
    resource_type             = "autonomousdatabase"
    matching_compartment_name = "lz-top-cmp"
  },
  "lz-sec-fun-dynamic-group" = {
    name                      = "lz-sec-fun-dynamic-group"
    description               = "Landing Zone dynamic group for functions in lz-security-cmp compartment."
    resource_type             = "fnfunc"
    matching_compartment_name = "lz-security-cmp"
  },
  "lz-appdev-fun-dynamic-group" = {
    name                      = "lz-appdev-fun-dynamic-group"
    description               = "Landing Zone dynamic group for functions in lz-appdev-cmp compartment."
    resource_type             = "fnfunc"
    matching_compartment_name = "lz-appdev-cmp"
  },
  "lz-adb-dynamic-group" = {
    name                      = "lz-adb-dynamic-group"
    description               = "Landing Zone dynamic group for databases in lz-database-cmp compartment."
    resource_type             = "autonomousdatabase"
    matching_compartment_name = "lz-database-cmp"
  },
}


dg_policy_params = {
  "lz-top-cmp-adb-kms-policy" = {
    name             = "lz-top-cmp-adb-kms-policy"
    description      = "Landing Zone provisioning policy ADB to access vaults and keys in lz-top-cmp compartment."
    compartment_name = "lz-top-cmp"
    statements = ["Allow dynamic-group lz-top-cmp-adb-dynamic-group to manage vaults in compartment lz-top-cmp",
      "Allow dynamic-group  lz-top-cmp-adb-dynamic-group to manage keys in compartment lz-top-cmp"
    ]
  },
  "lz-database-dg-admin-policy" = {
    name             = "lz-database-dg-admin-policy"
    description      = "Landing Zone policy for lz-database-admin-group group to manage database related resources."
    compartment_name = "lz-top-cmp"
    statements = ["Allow dynamic-group lz-top-cmp-adb-dynamic-group to manage vaults in compartment lz-security-cmp",
      "Allow dynamic-group lz-top-cmp-adb-dynamic-group to manage keys in compartment lz-security-cmp"
    ]
  }
}
