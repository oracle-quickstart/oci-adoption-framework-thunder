// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


topic_params = {
  lz-security-topic = {
    comp_name   = "lz-security-cmp"
    topic_name  = "lz-security-topic"
    description = "Landing Zone topic for security related notifications."
  },
  lz-network-topic = {
    comp_name   = "lz-security-cmp"
    topic_name  = "lz-network-topic"
    description = "Landing Zone topic for network related notifications."
  }
}

subscription_params = {
  subscription1 = {
    comp_name  = "lz-security-cmp"
    endpoint   = "gabriel.feodorov@oracle.com"
    protocol   = "EMAIL"
    topic_name = "lz-security-topic"
  }
  subscription2 = {
    comp_name  = "lz-security-cmp"
    endpoint   = "gabriel.feodorov@oracle.com"
    protocol   = "EMAIL"
    topic_name = "lz-network-topic"
  }
}
