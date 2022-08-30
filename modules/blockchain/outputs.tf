// Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "blockchain" {
  value = { for platform in oci_blockchain_blockchain_platform.this :
    platform.display_name => platform.service_endpoint
  }
}
