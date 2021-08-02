// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "vcns" {
  value = module.network.vcns
}

output "subnets" {
  value = module.network.subnets
}

output "compute_linux_instances" {
  value = module.compute.linux_instances
}

output "load_balancer_lbs" {
  value = module.load-balancer.load_balancers
}

output "nw_ipsec_tunnel_ips" {
  value = module.ipsec.ipsec_tunnel_ips
}
