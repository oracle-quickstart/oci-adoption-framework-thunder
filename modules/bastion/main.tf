// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


resource "oci_bastion_bastion" "this" {
  for_each                     = var.bastion_params
  name                         = each.value.bastion_name
  bastion_type                 = each.value.bastion_type
  compartment_id               = var.compartments[each.value.comp_name]
  target_subnet_id             = var.subnets[each.value.subnet_name]
  client_cidr_block_allow_list = each.value.cidr_block_allow_list
  max_session_ttl_in_seconds   = each.value.max_session_ttl_in_seconds
}
