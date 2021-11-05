// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartments = {
  sandbox = "ocid-of-sandbox"
}

blockchain_params = {
  "obp-ex" = {
    compartment_name  = "sandbox"
    compute_shape     = "ENTERPRISE_SMALL"
    idcs_access_token = "idcs-access-token"
    name              = "obp-ex"
    platform_role     = "FOUNDER"
  }
}

osn_params = {
  "osn1" = {
    ad            = "AD1"
    ocpu          = 1
    platform_name = "obp-ex"
  }
}
peer_params = {
  "peer1" = {
    ad            = "AD2"
    alias         = "peer"
    ocpu          = 1
    platform_name = "obp-ex"
    role          = "MEMBER" # ADMIN or MEMBER
  }
}
