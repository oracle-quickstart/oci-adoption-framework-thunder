// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


output "service_connectors" {
    value = {for sc in oci_sch_service_connector.this:
    sc.display_name => sc.id}
}