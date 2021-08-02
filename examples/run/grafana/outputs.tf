// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "grafana_instance" {
  value = module.grafana.grafana_instance
}

output "grafana_connection_url" {
  value = module.grafana.grafana_connection_url
}
