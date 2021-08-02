// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ids[var.instance_params[keys(var.instance_params)[0]].compartment_name]
}


data "template_file" "block_volumes_templates" {
  for_each = var.instance_params
  template = file("${path.module}/../../userdata/fss_replication_local.sh")

  vars = {
    length               = (length(split(" ", each.value.device_disk_mappings)) - 1)
    device_disk_mappings = each.value.device_disk_mappings
    block_vol_att_type   = each.value.block_vol_att_type

    src_mount_path                     = each.value.src_mount_path
    dst_mount_path                     = each.value.dst_mount_path
    src_export_path                    = each.value.src_export_path
    dst_export_path                    = each.value.dst_export_path
    src_mount_target_private_ip        = var.mount_targets_src[each.value.src_mount_name]
    dst_mount_target_private_ip        = var.mount_targets_src[each.value.dst_mount_name]
    data_sync_frequency                = each.value.data_sync_frequency
  }
}

data "template_cloudinit_config" "config" {
  for_each      = var.instance_params
  gzip          = false
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "fss_replication.sh"
    content_type = "text/x-shellscript"
    content      = data.template_file.block_volumes_templates[each.value.hostname].rendered
  }
}

resource "oci_core_instance" "this" {
  for_each                            = var.instance_params
  availability_domain                 = data.oci_identity_availability_domains.ads.availability_domains[each.value.ad - 1].name
  compartment_id                      = var.compartment_ids[each.value.compartment_name]
  shape                               = each.value.shape
  display_name                        = each.value.hostname
  preserve_boot_volume                = each.value.preserve_boot_volume
  freeform_tags                       = each.value.freeform_tags
  is_pv_encryption_in_transit_enabled = each.value.encrypt_in_transit
  fault_domain                        = format("FAULT-DOMAIN-%s", each.value.fd)


  create_vnic_details {
    assign_public_ip = each.value.assign_public_ip
    subnet_id        = var.subnet_ids[each.value.subnet_name]
    hostname_label   = each.value.hostname
    nsg_ids          = [for nsg in each.value.nsgs: var.nsgs[nsg]]
  }

  source_details {
    boot_volume_size_in_gbs = each.value.boot_volume_size
    source_type             = "image"
    source_id               = var.linux_images[var.region][each.value.image_version]
    kms_key_id              = length(var.kms_key_ids) == 0 || each.value.kms_key_name == "" ? "" : var.kms_key_ids[each.value.kms_key_name]
  }

  metadata = {
    ssh_authorized_keys = file(each.value.ssh_public_key)
    user_data           = data.template_cloudinit_config.config[each.value.hostname].rendered
  }
}
