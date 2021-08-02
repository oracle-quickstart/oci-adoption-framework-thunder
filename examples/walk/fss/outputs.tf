// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "filesystems" {
  value = module.fss.filesystems
}

output "mount_targets" {
  value = module.fss.mount_targets
}
