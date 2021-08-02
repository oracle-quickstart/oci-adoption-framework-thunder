// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
private_ip_instances = {
  hur1 = "10.0.1.3"
}

compartment_ids = {
  sandbox = "ocid1..."
}

subnet_ids = {
  hur1pub = "ocid1..."
}

lb_params = {
  "hur-lb" = {
    shape            = "flexible"
    compartment_name = "sandbox"
    subnet_names     = ["hur1pub"]
    display_name     = "hur-lb"
    is_private       = false
    shape_details = [
      {
        min_bw = 100
        max_bw = 500
      },
    ]
  }
}

backend_sets = {
  "hur1-bs" = {
    name        = "hur1-bs"
    lb_name     = "hur-lb"
    policy      = "ROUND_ROBIN"
    hc_port     = 80
    hc_protocol = "HTTP"
    hc_url      = "/"
  }
}

listeners = {
  "hur-list" = {
    lb_name          = "hur-lb"
    name             = "hur-list"
    backend_set_name = "hur1-bs"
    port             = 80
    protocol         = "HTTP"
    ssl              = []
  }
}

backend_params = {
  "hur1-bs" = {
    backendset_name = "hur1-bs"
    use_instance    = true
    instance_name   = "hur1"
    lb_name         = "hur-lb"
    port            = 80
    lb_backend_name = ""
  }
}

certificates = {}
