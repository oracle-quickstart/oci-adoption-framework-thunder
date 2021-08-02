// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "zones" {
  value = [for zone in oci_dns_zone.this:
    {"id": zone.id, "name": zone.name}
  ]
}

output "records" {
  value = [for record in oci_dns_rrset.this:
    {"domain": record.domain, "data": [for item in record.items: item.rdata]}
  ]
}
