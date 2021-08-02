// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "database" {
  value = {
    for db in oci_database_db_system.this:
      db.display_name => db.id 
  }
}
