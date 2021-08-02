// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "users" {
  value = module.iam.users
}

output "compartments" {
  value = module.iam.compartments
}

output "groups" {
  value = module.iam.groups
}

output "policies" {
  value = module.iam.policies
}
