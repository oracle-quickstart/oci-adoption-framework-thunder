// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
compartment_ids = {
  sandbox = "ocid1...."
}
instances = {
  hur1 = "10.0.1.3"
}

load_balancer_params = {
  hur-lb = {
    lb_id              = "ocid1...."
    comp_id            = "ocid1...."
  }
}
zone_params = {
  "hur1.com" = {
    compartment_name  = "sandbox"
    zone_name         = "hur1.com"
    zone_type         = "PRIMARY"
    external_masters  = []
  }
  "hur2.com" = {
    compartment_name = "sandbox"
    zone_name        = "hur2.com"
    zone_type        = "SECONDARY"
    external_masters = [
      {
        ip = "2.2.2.2"
      },
      {
        ip = "1.1.1.1"
      },
    ]
  }
}

dns_records_params = {
  "primary1.hur1.com" = {
    zone_name         = "hur1.com"
    domain            = "primary1.hur1.com"
    rtype             = "A"
    ttl               = 300
    rdata             = null
    use_instance      = true
    instance_name     = "hur1"
    use_lb            = null
    lb_name           = null
  }
  "primary2.hur1.com" = {
    zone_name         = "hur1.com"
    domain            = "primary2.hur1.com"
    rtype             = "A"
    ttl               = 300
    rdata             = null
    use_instance      = false
    instance_name     = null
    use_lb            = true
    lb_name          = "hur-lb"
  }
  "primary3.hur1.com" = {
    zone_name         = "hur1.com"
    domain            = "primary3.hur1.com"
    rtype             = "A"
    ttl               = 300
    rdata             = "1.1.1.1"
    use_instance      = false
    instance_name     = null
    use_lb            = false
    lb_name           = null
  }
}
