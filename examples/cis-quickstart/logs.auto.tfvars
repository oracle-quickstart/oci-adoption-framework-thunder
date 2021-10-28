



log_group_params = {
  lz-flow-logs-group = {
    comp_name      = "lz-security-cmp"
    log_group_name = "lz-flow-logs-group"
  },
  lz-object-storage-log-group = {
    comp_name      = "lz-security-cmp"
    log_group_name = "lz-object-storage-log-group"
  }
}


log_params = {
  lz-0-web-subnet-flow-log = {
    log_name            = "lz-0-web-subnet-flow-log"
    log_group           = "lz-flow-logs-group"
    log_type            = "SERVICE"
    source_log_category = "all"
    source_resource     = "lz-0-web-subnet"
    source_service      = "flowlogs"
    source_type         = "OCISERVICE"
    comp_name           = "lz-security-cmp"
    is_enabled          = true
    retention_duration  = 30
  },
  lz-0-app-subnet-flow-log = {
    log_name            = "lz-0-app-subnet-flow-log"
    log_group           = "lz-flow-logs-group"
    log_type            = "SERVICE"
    source_log_category = "all"
    source_resource     = "lz-0-app-subnet"
    source_service      = "flowlogs"
    source_type         = "OCISERVICE"
    comp_name           = "lz-security-cmp"
    is_enabled          = true
    retention_duration  = 30
  },
  lz-0-db-subnet-flow-log = {
    log_name            = "lz-0-db-subnet-flow-log"
    log_group           = "lz-flow-logs-group"
    log_type            = "SERVICE"
    source_log_category = "all"
    source_resource     = "lz-0-db-subnet"
    source_service      = "flowlogs"
    source_type         = "OCISERVICE"
    comp_name           = "lz-security-cmp"
    is_enabled          = true
    retention_duration  = 30
  },
  lz-appdev-bucket-object-storage-log = {
    log_name            = "lz-appdev-bucket-object-storage-log"
    log_group           = "lz-object-storage-log-group"
    log_type            = "SERVICE"
    source_log_category = "write"
    source_resource     = "lz-appdev-bucket"
    source_service      = "objectstorage"
    source_type         = "OCISERVICE"
    comp_name           = "lz-security-cmp"
    is_enabled          = true
    retention_duration  = 30
  }


}



