// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.



output "bastions" {
  value = {
    for bst in oci_bastion_bastion.this :
    bst.name => bst.id
  }
}
