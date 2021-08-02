// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "cluster_ids" {
  value = module.oke.cluster_ids
}

output "pods_cidrs" {
  value = module.oke.pods_cidrs
}

output "number_of_nodes" {
  value = module.oke.number_of_nodes
}

# output "kubeconfig" {
#   value = module.okeadmin.kubeconfig
# }
