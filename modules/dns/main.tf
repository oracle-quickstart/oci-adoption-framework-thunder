// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_dns_zone" "this" {
  for_each       = var.zone_params
  compartment_id = var.compartments[each.value.compartment_name]
  name           = each.value.zone_name
  zone_type      = each.value.zone_type
  dynamic "external_masters" {
    iterator = ip
    for_each = each.value.external_masters
    content {
      address = ip.value.ip
    }
  }
}

data "oci_load_balancer_load_balancers" "existing" {
  for_each       = var.load_balancer_params
  compartment_id = each.value.comp_id
  filter          {
    name  = "id"
    values = [each.value.lb_id]
  }
}

resource "oci_dns_rrset" "this" {
    for_each = var.dns_records_params
    domain = each.value.domain
    rtype = each.value.rtype
    zone_name_or_id = oci_dns_zone.this[each.value.zone_name].id

    dynamic "items" {
    iterator = dns_items
    for_each = each.value.dns_items
    content {
      domain = dns_items.value.domain
      rdata = dns_items.value.use_instance ? var.instances[dns_items.value.instance_name] : dns_items.value.use_lb ? data.oci_load_balancer_load_balancers.existing[dns_items.value.lb_name].load_balancers[0].ip_address_details[0].ip_address : dns_items.value.rdata
      rtype = dns_items.value.rtype
      ttl = dns_items.value.ttl
    }
  }
}
