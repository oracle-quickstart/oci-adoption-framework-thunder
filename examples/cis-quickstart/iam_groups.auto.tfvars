// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


group_params = {
  "lz-iam-admin-group" = {
    name        = "lz-iam-admin-group"
    description = "Landing Zone group for managing IAM resources in the tenancy."
  }
}
group_params2 = {

  "lz-security-admin-group" = {
    name        = "lz-security-admin-group"
    description = "Landing Zone group for managing security services in compartment lz-security-cmp."
  },
  "lz-network-admin-group" = {
    name        = "lz-network-admin-group"
    description = "Landing Zone group for managing networking in compartment lz-network-cmp."
  },
  "lz-database-admin-group" = {
    name        = "lz-database-admin-group"
    description = "Landing Zone group for managing databases in compartment lz-database-cmp."
  },
  "lz-appdev-admin-group" = {
    name        = "lz-appdev-admin-group"
    description = "Landing Zone group for managing app development related services in compartment lz-appdev-cmp."
  },
  "lz-cred-admin-group" = {
    name        = "lz-cred-admin-group"
    description = "Landing Zone group for managing users credentials in the tenancy."
  },
  "lz-auditor-group" = {
    name        = "lz-auditor-group"
    description = "Landing Zone group for auditing the tenancy."
  },
  "lz-announcement-reader-group" = {
    name        = "lz-announcement-reader-group"
    description = "Landing Zone group for reading Console announcements."
  }
}
