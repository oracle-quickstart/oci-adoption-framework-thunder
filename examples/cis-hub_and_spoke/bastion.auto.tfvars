// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


bastion_params = {
  bast1 = {
    bastion_name               = "lz-security-cmp"
    bastion_type               = "STANDARD"
    comp_name                  = "lz-security-cmp"
    subnet_name                = "lz-0-web-subnet"
    cidr_block_allow_list      = []
    max_session_ttl_in_seconds = 10800
  }
}
