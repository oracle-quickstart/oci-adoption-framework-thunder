// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "kms_vault_ids" {
  value = { for vault in oci_kms_vault.this :
    vault.display_name => vault.id
  }
}

# allows "" values for kms_key_name 
# so that kms_key_id will be "" in the resource
# output "kms_key_ids" {
#   value = merge({ for key in oci_kms_key.this :
#     key.display_name => key.id
#   }, { "" = "" })
# }

output "kms_key_ids" {
  value = { for key in oci_kms_key.this :
  key.display_name => key.id }
}

output "keys_versions_map" {
  value = local.keys_versions_map
}
