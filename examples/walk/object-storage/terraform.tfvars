// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartments = {
  sandbox = "ocid1...."
}

bucket_params = {
  hur-buck-1 = {
    compartment_name = "sandbox"
    name             = "hur-buck-1"
    access_type      = "NoPublicAccess"
    storage_tier     = "Standard"
    events_enabled   = false
    kms_key_name     = ""
  }
}

kms_key_ids = {}
