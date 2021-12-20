// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

locals {
  adw_download_wallet = { for key, value in var.adw_params : key => value if value.create_local_wallet == true }
}

resource "random_string" "autonomous_database_wallet_password" {
  for_each         = var.adw_params
  length           = 16
  special          = true
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = 3
  override_special = "{}#^*<>[]%~"
}

resource "oci_database_autonomous_database_wallet" "autonomous_database_wallet" {
  for_each               = var.adw_params
  autonomous_database_id = oci_database_autonomous_database.adw[each.value.db_name].id
  password               = random_string.autonomous_database_wallet_password[each.value.db_name].result
  base64_encode_content  = "true"
}

resource "local_file" "autonomous_data_warehouse_wallet_file" {
  for_each       = local.adw_download_wallet
  content_base64 = oci_database_autonomous_database_wallet.autonomous_database_wallet[each.value.db_name].content
  filename       = "${path.cwd}/autonomous_data_wallet_${each.value.db_name}_${formatdate("DDMMMYYYYhh-mm", timestamp())}.zip"
}

resource "oci_database_autonomous_database" "adw" {
  for_each                 = var.adw_params
  admin_password           = random_string.autonomous_database_wallet_password[each.value.db_name].result
  compartment_id           = var.compartment_ids[each.value.compartment_name]
  cpu_core_count           = each.value.cpu_core_count
  data_storage_size_in_tbs = each.value.size_in_tbs
  db_name                  = each.value.db_name
  display_name             = each.value.db_name
  db_workload              = each.value.db_workload
  is_auto_scaling_enabled  = each.value.enable_auto_scaling
  is_free_tier             = each.value.is_free_tier
}
