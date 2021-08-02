// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "vcns" {
  value = module.network.vcns
}

output "subnets" {
  value = module.network.subnets
}

output "nsgs" {
  value = module.network.nsgs
}
