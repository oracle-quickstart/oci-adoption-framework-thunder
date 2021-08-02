// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "filesystems_source" {
  value = module.fss_source.filesystems
}

output "mount_targets_source" {
  value = module.fss_source.mount_targets
}

 output "filesystems_dest" {
   value = module.fss_second.filesystems
 }

 output "mount_targets_dest" {
   value = module.fss_second.mount_targets
 }

output "linux_instances" {
  value = module.compute.linux_instances
}

output "linux_instances_second" {
  value = module.compute_second.linux_instances
}
