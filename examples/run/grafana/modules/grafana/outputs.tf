// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "grafana_instance" {
  value = {"name": oci_core_instance.this.display_name, "id": oci_core_instance.this.id}
}

output "grafana_connection_url" {
  value = format("In order to connect to the grafana console, you must ensure you can access the instance on port 3000\nThe url is the following:\nhttp://%s:%s\n", oci_core_instance.this.public_ip, "3000")
}
