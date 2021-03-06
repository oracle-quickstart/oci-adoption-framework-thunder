// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
output "buckets" {
  value = {
    for bucket in oci_objectstorage_bucket.this :
    bucket.name => bucket.access_type
  }
}



output "bucket_id" {
  value = {
    for bucket in oci_objectstorage_bucket.this :
    bucket.name => bucket.bucket_id
  }
}
