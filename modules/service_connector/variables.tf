// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "oci_provider" {
  type = map(string)
}

variable "compartments" {
  type = map(string)
}

variable "log_group" {
  type = map(string)
}

variable "log_id" {
  type = map(string)
}

variable "streaming" {
  type = map(string)
}

variable "functions" {
  type = map(string)
}

variable "topics" {
  type = map(string)
}




variable "srv_connector_params" {
  type = map(object({
    comp_name                 = string
    display_name              = string
    srv_connector_source_kind = string
    log_sources_params = list(object({
      log_comp_name  = string
      log_group_name = string
      log_name       = string
    }))
    stream_name                    = string
    srv_connector_target_kind      = string
    obj_batch_rollover_size_in_mbs = string
    obj_batch_rollover_time_in_ms  = string
    obj_target_bucket              = string
    monitoring_compartment         = string
    function_name                  = string
    target_log_group               = string
    mon_target_metric              = string
    mon_target_metric_namespace    = string
    target_stream_name             = string
    target_topic_name              = string
    tasks_params = list(object({
      tasks_kind             = string
      task_batch_size_in_kbs = string
      task_batch_time_in_sec = string
      task_function_name     = string
    }))
  }))
}


