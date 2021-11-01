// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


bucket_params = {
  lz-appdev-bucket = {
    compartment_name = "lz-appdev-cmp"
    name             = "lz-appdev-bucket"
    access_type      = "NoPublicAccess"
    storage_tier     = "Standard"
    events_enabled   = false
    kms_key_name     = "lz-oss-key"
  }
}
