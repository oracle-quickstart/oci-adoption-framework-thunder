// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_monitoring_alarm" "this" {
  for_each                         = var.alarm_params
  compartment_id                   = var.compartments[each.value.comp_name]
  destinations                     = [for i in each.value.destinations : var.topics[i]]
  display_name                     = each.value.alarm_display_name
  is_enabled                       = each.value.alarm_is_enabled
  metric_compartment_id            = var.compartments[each.value.alarm_metric_comp_name]
  namespace                        = each.value.alarm_namespace
  query                            = each.value.alarm_query
  severity                         = each.value.alarm_severity
  body                             = each.value.alarm_body
  metric_compartment_id_in_subtree = each.value.alarm_metric_compartment_id_in_subtree
  pending_duration                 = each.value.alarm_pending_duration
  repeat_notification_duration     = each.value.alarm_repeat_notification_duration
  resolution                       = each.value.alarm_resolution
  resource_group                   = each.value.alarm_resource_group

  dynamic "suppression" {
    iterator = suppression
    for_each = each.value.suppression_params
    content {
      time_suppress_from  = suppression.value.alarm_suppression_time_suppress_from
      time_suppress_until = suppression.value.alarm_suppression_time_suppress_until
      description         = suppression.value.alarm_suppression_description
    }
  }
}
