// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "private_ips" {
  value = [for key, value in oci_core_instance.this : value.private_ip]
}
