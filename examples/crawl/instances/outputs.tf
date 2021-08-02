// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "linux_instances" {
  value = module.compute.linux_instances
}

output "windows_instances" {
  value = module.compute.windows_instances
}
