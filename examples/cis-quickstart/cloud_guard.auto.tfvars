


cloud_guard_config = {
  cg_config = {
    comp_name             = "lz-top-cmp"
    status                = "ENABLED"
    self_manage_resources = false
    region_name           = "us-ashburn-1"
  }
}


cloud_guard_target = {
  # lz-cloud-guard-root-target = {
  #   display_name = "lz-cloud-guard-root-target"
  #   comp_name    = "lz-top-cmp"
  #   target_name  = "lz-security-cmp"
  #   target_type  = "COMPARTMENT"
  # }
  lz-security-cmp = {
    display_name = "lz-security-cmp"
    comp_name    = "lz-security-cmp"
    target_name  = "lz-security-cmp"
    target_type  = "COMPARTMENT"
  }
}
