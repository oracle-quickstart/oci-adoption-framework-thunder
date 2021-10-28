// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "cloud_guard_config" {
    value = {for config in oci_cloud_guard_cloud_guard_configuration.this :
    config.reporting_region => config.status}
}



output "cloud_guard_target" {
    value = {for target in oci_cloud_guard_target.this :
    target.display_name => target.id}
}

