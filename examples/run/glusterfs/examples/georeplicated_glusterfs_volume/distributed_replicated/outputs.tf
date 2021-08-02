// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "private_ips_region1" {
  value = module.glusterfs_region_1.private_ips
}

output "private_ips_region2" {
  value = module.glusterfs_region_2.private_ips
}
