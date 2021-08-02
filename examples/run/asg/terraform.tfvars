// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
compartment_ids = {
  sandbox = "ocid1...."
}
subnet_ids      = {
  hur1pub  = "ocid1...."
  hur1priv = "ocid1...."
}

images = {
  ap-mumbai-1    = "ocid1...."
  ap-seoul-1     = "ocid1...."
  ap-sydney-1    = "ocid1...."
  ap-tokyo-1     = "ocid1...."
  ca-toronto-1   = "ocid1...."
  eu-frankfurt-1 = "ocid1...."
  eu-zurich-1    = "ocid1...."
  sa-saopaulo-1  = "ocid1...."
  uk-london-1    = "ocid1...."
  us-ashburn-1   = "ocid1...."
  us-langley-1   = "ocid1...."
  us-luke-1      = "ocid1...."
  us-phoenix-1   = "ocid1...."
}

backend_sets      = {}
load_balancer_ids = {}

asg_params = {
  asg1 = {
    compartment_name = "sandbox"
    name             = "asg1"
    freeform_tags    = {}
    shape            = "VM.Standard2.1"
    assign_public_ip = "true"
    ssh_public_key   = "/root/.ssh/id_rsa.pub"
    hostname         = "asg1"
    size             = 2
    state            = "RUNNING" # Can be RUNNING or STOPPED
    p_config         = [
      {
        ad     = 1
        subnet = "hur1pub"
      },
      {
        ad     = 2
        subnet = "hur1pub"
      },
      {
        ad     = 3
        subnet = "hur1pub"
      }
    ]
    lb_config        = []
    initial_capacity = 2
    max_capacity     = 6
    min_capacity     = 2
    policy_name      = "asg_policy"
    policy_type      = "threshold"
    rules            = [
      {
        rule_name    = "scaleUp"
        action_type  = "CHANGE_COUNT_BY"
        action_value = 2
        metrics      = [
          {
            metric_type     = "CPU_UTILIZATION"
            metric_operator = "GT"
            threshold_value = 70
          }
        ]
      },
      {
        rule_name    = "scaleDown"
        action_type  = "CHANGE_COUNT_BY"
        action_value = -1
        metrics      = [
          {
            metric_type     = "CPU_UTILIZATION"
            metric_operator = "LT"
            threshold_value = 30
          }
        ]
      }
    ]
    cool_down_in_seconds   = 300
    is_autoscaling_enabled = true
  }
}
