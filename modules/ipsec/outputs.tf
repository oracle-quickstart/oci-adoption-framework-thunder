// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "ipsec_tunnel_ips" {
  value = { 
    for tunnel, tunnel_values in data.oci_core_ipsec_connection_tunnels.this : 
      tunnel => [for values in tunnel_values.ip_sec_connection_tunnels:
        values.vpn_ip]
  }
}
