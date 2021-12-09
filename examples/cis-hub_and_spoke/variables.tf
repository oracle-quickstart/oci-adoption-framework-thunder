// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
variable "provider_oci" {
  type = map(string)
}

## IAM modules variables
variable "comp_params" {
  type = map(object({
    name          = string
    description   = string
    enable_delete = bool
    parent_name   = string
  }))
}

variable "parent_comp" {
  type        = map(any)
  default     = {}
  description = "Leave it empty if you want to create compartments under tenancy"
}

variable "user_params" {
  type = map(object({
    name        = string
    description = string
    group_name  = string
  }))
}

variable "group_params" {
  type = map(object({
    name        = string
    description = string
  }))
}

variable "group_params2" {
  type = map(object({
    name        = string
    description = string
  }))
}

variable "policy_params" {
  type = map(object({
    name             = string
    description      = string
    compartment_name = string
    statements       = list(string)
  }))
}

variable "policy_params2" {
  type = map(object({
    name             = string
    description      = string
    compartment_name = string
    statements       = list(string)
  }))
}

variable "comp_params2" {
  type = map(object({
    name          = string
    description   = string
    enable_delete = bool
    parent_name   = string
  }))
}

### Dynamic groups variables
variable "dynamic_groups" {
  type = map(object({
    name                      = string
    description               = string
    resource_type             = string
    matching_compartment_name = string
  }))
}

variable "dg_policy_params" {
  type = map(object({
    name             = string
    compartment_name = string
    description      = string
    statements       = list(string)
  }))
}

variable "vcn_params" {
  description = "VCN Parameters: vcn_cidr, display_name, dns_label"
  type = map(object({
    vcn_cidr         = string
    compartment_name = string
    display_name     = string
    dns_label        = string
  }))
}

variable "igw_params" {
  description = "Placeholder for vcn index association and igw name"
  type = map(object({
    vcn_name     = string
    display_name = string
  }))
}

variable "ngw_params" {
  description = "Placeholder for vcn index association and ngw name"
  type = map(object({
    vcn_name     = string
    display_name = string
  }))
}

variable "sgw_params" {
  description = "Placeholder for vcn index association and ngw name"
  type = map(object({
    vcn_name     = string
    display_name = string
    service_name = string
  }))
}


variable "rt_params" {
  description = "Placeholder for vcn index association, rt name, route rules"
  type = map(object({
    vcn_name     = string
    display_name = string
    route_rules = list(object({
      destination = string
      use_igw     = bool
      igw_name    = string
      use_sgw     = bool
      sgw_name    = string
      ngw_name    = string
    }))
  }))
}


variable "subnet_params" {
  type = map(object({
    display_name      = string
    cidr_block        = string
    dns_label         = string
    is_subnet_private = bool
    sl_name           = string
    rt_name           = string
    vcn_name          = string
  }))
}

variable "sl_params" {
  description = "Security List Params"
  type = map(object({
    vcn_name     = string
    display_name = string
    egress_rules = list(object({
      stateless   = string
      protocol    = string
      destination = string
    }))
    ingress_rules = list(object({
      stateless   = string
      protocol    = string
      source      = string
      source_type = string
      tcp_options = list(object({
        min = number
        max = number
      }))
      udp_options = list(object({
        min = number
        max = number
      }))
    }))
  }))
}

variable "nsg_params" {
  type = map(object({
    vcn_name     = string
    display_name = string
  }))
}

variable "nsg_rules_params" {
  type = map(object({
    nsg_name         = string
    protocol         = string
    stateless        = string
    direction        = string
    source           = string
    source_type      = string
    destination      = string
    destination_type = string
    tcp_options = list(object({
      destination_ports = list(object({
        min = number
        max = number
      }))
      source_ports = list(object({
        min = number
        max = number
      }))
    }))
    udp_options = list(object({
      destination_ports = list(object({
        min = number
        max = number
      }))
      source_ports = list(object({
        min = number
        max = number
      }))
    }))
  }))
}


variable "lpg_params" {
  type = map(object({
    acceptor     = string
    requestor    = string
    display_name = string
  }))
}

variable "drg_params" {
  type = map(object({
    name     = string
    vcn_name = string
  }))
}

variable "drg_attachment_params" {
  type = map(object({
    drg_name = string
    vcn_name = string
    cidr_rt  = list(string)
    rt_names = list(string)
  }))
}


variable "topic_params" {
  type = map(object({
    comp_name   = string
    topic_name  = string
    description = string
  }))
}

variable "subscription_params" {
  type = map(object({
    comp_name  = string
    endpoint   = string
    protocol   = string
    topic_name = string
  }))
}


variable "bucket_params" {
  type = map(object({
    compartment_name = string
    name             = string
    access_type      = string
    storage_tier     = string
    events_enabled   = bool
    kms_key_name     = string
  }))
}

variable "vault_params" {
  type = map(object({
    compartment_name = string
    display_name     = string
    vault_type       = string
  }))

}

variable "key_params" {
  type = map(object({
    compartment_name        = string
    display_name            = string
    vault_name              = string
    key_shape_algorithm     = string
    key_shape_size_in_bytes = number
    rotation_version        = number
  }))
}



variable "log_group_params" {
  type = map(object({
    comp_name      = string
    log_group_name = string
  }))
}


variable "log_params" {
  type = map(object({
    log_name            = string
    log_group           = string
    log_type            = string
    source_log_category = string
    source_resource     = string
    source_service      = string
    source_type         = string
    comp_name           = string
    is_enabled          = bool
    retention_duration  = number
  }))
}

variable "scan_recipes_params" {
  type = map(object({
    display_name         = string
    comp_name            = string
    scan_level           = string
    agent_config_vendor  = string
    cis_bench_scan_level = string
    port_scan_level      = string
    schedule_type        = string
    day_of_week          = string
  }))
}


variable "scan_target_params" {
  type = map(object({
    display_name     = string
    comp_name        = string
    recipe_name      = string
    target_comp_name = string
  }))
}


variable "events_params" {
  type = map(object({
    rule_display_name = string
    compartment_name  = string
    rule_is_enabled   = bool
    condition         = any
    freeform_tags     = map(any)
    action_params = list(object({
      action_type         = string
      actions_description = string
      is_enabled          = bool
      function_name       = string
      topic_name          = string
      stream_name         = string
    }))
  }))
}


variable "cloud_guard_config" {
  type = map(object({
    comp_name             = string
    status                = string
    self_manage_resources = bool
    region_name           = string
  }))
}


variable "cloud_guard_target" {
  type = map(object({
    comp_name    = string
    display_name = string
    target_name  = string
    target_type  = string
  }))
}


variable "bastion_params" {
  type = map(object({
    bastion_name               = string
    bastion_type               = string
    comp_name                  = string
    subnet_name                = string
    cidr_block_allow_list      = list(string)
    max_session_ttl_in_seconds = number
  }))
}

variable "service_connector_bucket_params" {
  type = map(object({
    compartment_name = string
    name             = string
    access_type      = string
    storage_tier     = string
    events_enabled   = bool
    kms_key_name     = string
  }))
}

variable "srv_connector_params" {
  type = map(object({
    comp_name                 = string
    display_name              = string
    srv_connector_source_kind = string
    state                     = string
    log_sources_params = list(object({
      log_comp_name  = string
      log_group_name = string
      is_audit       = bool
      log_name       = string
    }))
    source_stream_name             = string
    srv_connector_target_kind      = string
    obj_batch_rollover_size_in_mbs = string
    obj_batch_rollover_time_in_ms  = string
    obj_target_bucket              = string
    object_name_prefix             = string
    target_comp_name               = string
    function_name                  = string
    target_log_group               = string
    mon_target_metric              = string
    mon_target_metric_namespace    = string
    target_stream_name             = string
    target_topic_name              = string
    tasks = list(object({
      tasks_kind             = string
      task_batch_size_in_kbs = string
      task_batch_time_in_sec = string
      task_function_name     = string
    }))
  }))
}
