// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

service_connector_bucket_params = {
  lz-audit-sch-bucket = {
    compartment_name = "lz-security-cmp"
    name             = "lz-audit-sch-bucket"
    access_type      = "NoPublicAccess"
    storage_tier     = "Standard"
    events_enabled   = false
    kms_key_name     = ""
  },
  lz-vcn-flow-logs-sch-bucket = {
    compartment_name = "lz-security-cmp"
    name             = "lz-vcn-flow-logs-sch-bucket"
    access_type      = "NoPublicAccess"
    storage_tier     = "Standard"
    events_enabled   = false
    kms_key_name     = ""
  },
}

srv_connector_params = {

  lz-vcn-flow-logs-sch = {
    display_name              = "lz-vcn-flow-logs-sch"
    comp_name                 = "lz-security-cmp"
    srv_connector_source_kind = "logging"
    state                     = "INACTIVE"
    log_sources_params = [
      {
        log_comp_name  = "lz-security-cmp"
        log_group_name = "lz-flow-logs-group"
        is_audit       = false
        log_name       = "lz-0-web-subnet-flow-log"
      },
      {
        log_comp_name  = "lz-security-cmp"
        log_group_name = "lz-flow-logs-group"
        is_audit       = false
        log_name       = "lz-0-app-subnet-flow-log"
      },
      {
        log_comp_name  = "lz-security-cmp"
        log_group_name = "lz-flow-logs-group"
        is_audit       = false
        log_name       = "lz-0-db-subnet-flow-log"
      }
    ]
    source_stream_name             = null
    srv_connector_target_kind      = "objectstorage"
    obj_batch_rollover_size_in_mbs = 100
    obj_batch_rollover_time_in_ms  = 420000
    obj_target_bucket              = "lz-vcn-flow-logs-sch-bucket"
    object_name_prefix             = "sch-vcnFlowLogs"
    target_comp_name               = "lz-security-cmp"
    function_name                  = null
    target_log_group               = null
    mon_target_metric              = null
    mon_target_metric_namespace    = null
    target_stream_name             = null
    target_topic_name              = null
    tasks                          = []
  },
  lz-audit-sch = {
    display_name              = "lz-audit-sch"
    comp_name                 = "lz-security-cmp"
    srv_connector_source_kind = "logging"
    state                     = "INACTIVE"
    log_sources_params = [
      {
        log_comp_name  = "lz-security-cmp"
        log_group_name = "_Audit"
        is_audit       = true
        log_name       = ""
      },
      {
        log_comp_name  = "lz-network-cmp"
        log_group_name = "_Audit"
        is_audit       = true
        log_name       = ""
      },
      {
        log_comp_name  = "lz-appdev-cmp"
        log_group_name = "_Audit"
        is_audit       = true
        log_name       = ""
      },
      {
        log_comp_name  = "lz-database-cmp"
        log_group_name = "_Audit"
        is_audit       = true
        log_name       = ""
      }
    ]
    source_stream_name             = null
    srv_connector_target_kind      = "objectstorage"
    obj_batch_rollover_size_in_mbs = 100
    obj_batch_rollover_time_in_ms  = 420000
    obj_target_bucket              = "lz-audit-sch-bucket"
    object_name_prefix             = "sch-audit"
    target_comp_name               = "lz-security-cmp"
    function_name                  = null
    target_log_group               = null
    mon_target_metric              = null
    mon_target_metric_namespace    = null
    target_stream_name             = null
    target_topic_name              = null
    tasks                          = []
  },

}



