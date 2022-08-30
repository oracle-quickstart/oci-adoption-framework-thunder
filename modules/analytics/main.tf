// Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_analytics_analytics_instance" "this" {
  for_each = var.oac_params
  capacity {
    capacity_type  = each.value.capacity_type
    capacity_value = each.value.capacity_value
  }
  defined_tags = {}
  compartment_id    = var.compartment_ids[each.value.compartment_name] 
  feature_set       = each.value.feature_set
  idcs_access_token = file(each.value.idcs_token_path)
  license_type      = each.value.license_type
  name              = each.value.display_name
  description       = each.value.description
  freeform_tags = {}
  network_endpoint_details {
    #Required
    network_endpoint_type = each.value.network_type
    
    #Optional
    subnet_id = var.subnet_ids[each.value.subnet_name]
    vcn_id    = var.vcn_ids[each.value.vcn_name]
  }
  state="ACTIVE"
}