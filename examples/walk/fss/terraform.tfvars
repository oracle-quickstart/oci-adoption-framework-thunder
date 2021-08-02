// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
compartment_ids = {
  sandbox = "ocid1...."
}

subnet_ids = {
  hur1pub = "ocid1...."
}

fss_params = {
  thunder0 = {
    ad               = 1
    compartment_name = "sandbox"
    name             = "thunder0"
    kms_key_name     = ""
  }
}

mt_params = {
  mt0 = {
    ad               = 1
    compartment_name = "sandbox"
    name             = "mt0"
    subnet_name      = "hur1pub"
  }

  # mt2 = {
  #   ad               = 1
  #   compartment_name = "sandbox"
  #   name             = "mt2"
  #   subnet_name      = "hur1pub"
  # }
}

export_params = {
  mt1 = {
    export_set_name = "mt0"
    filesystem_name = "thunder0"
    path            = "/media"

    export_options = [
      {
        source   = "10.0.9.0/24"
        access   = "READ_WRITE"
        identity = "ROOT"
        use_port = true
      },
    ]
  }
}

kms_key_ids = {}
