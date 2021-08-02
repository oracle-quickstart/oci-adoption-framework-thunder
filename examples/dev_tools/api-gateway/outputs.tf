// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "gateways" {
  value = module.api-gateway.gateways
}

output "deployments" {
  value = module.api-gateway.deployments
}

output "api_endpoints" {
  value = module.api-gateway.routes
}
