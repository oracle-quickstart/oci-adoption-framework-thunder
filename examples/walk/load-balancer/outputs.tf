// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "load_balancers" {
  value = module.load-balancer.load_balancers
}

output "backend_sets" {
  value = module.load-balancer.backend_sets
}
