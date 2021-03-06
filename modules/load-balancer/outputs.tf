// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "load_balancers" {
  value = { for lb in oci_load_balancer.this:
    lb.display_name => {"id": lb.id, "ip": lb.ip_address_details[0].ip_address}
  }
}

output "backend_sets" {
  value = { for bs in oci_load_balancer_backendset.this:
    bs.name => bs.id
  }
}

output "lbs" {
  value = { for lb in oci_load_balancer.this:
    lb.display_name => {"lb_id" : lb.id, "comp_id": lb.compartment_id}
  }
}
