// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

vault_params = {
  lz-vault = {
    compartment_name = "lz-security-cmp"
    display_name     = "lz-vault"
    vault_type       = "DEFAULT"
  }
}

key_params = {
  lz-oss-key = {
    compartment_name        = "lz-security-cmp"
    display_name            = "lz-oss-key"
    vault_name              = "lz-vault"
    key_shape_algorithm     = "AES"
    key_shape_size_in_bytes = 32
    rotation_version        = 0
  }
}
