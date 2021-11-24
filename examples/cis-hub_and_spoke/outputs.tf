// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
# output "iam_users" {
#   value = module.iam.users
# }

output "iam_comp" {
  value = merge(module.iam_top_comp.compartments, module.iam.compartments)
}

output "iam_groups" {
  value = merge(module.iam_top_comp.groups, module.iam.groups)
}


