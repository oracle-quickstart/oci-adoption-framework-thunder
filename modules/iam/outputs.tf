// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "groups" {
  value = {
    for group in oci_identity_group.this:
      group.name => group.id
  }
}

output "users" {
  value = {
    for user in oci_identity_user.this:
      user.name => user.id
  }
}

output "compartments" {
  value = {
    for compartment in oci_identity_compartment.this:
      compartment.name => compartment.id
  }
}


output "policies" {
  value = {
    for policy in oci_identity_policy.this:
      policy.name => policy.id
  }
}
