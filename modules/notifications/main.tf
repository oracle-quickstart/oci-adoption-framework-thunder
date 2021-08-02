// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_ons_notification_topic" "this" {
  for_each       = var.topic_params
  compartment_id = var.compartments[each.value.comp_name]
  name           = each.value.topic_name
  description    = each.value.description
}

resource "oci_ons_subscription" "this" {
  for_each       = var.subscription_params
  compartment_id = var.compartments[each.value.comp_name]
  endpoint       = each.value.endpoint
  protocol       = each.value.protocol
  topic_id       = oci_ons_notification_topic.this[each.value.topic_name].id
}
