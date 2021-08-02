// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
# locals {
#   linux_boot_volumes      = [for instance in var.instance_params : instance.boot_volume_size >= 50 ? null : file(format("\n\nERROR: The boot volume size for linux instance %s is less than 50GB which is not permitted. Please add a boot volume size of 50GB or more", instance.hostname))]
#   windows_boot_volumes    = [for instance in var.win_instance_params : instance.boot_volume_size >= 256 ? null : file(format("\n\nERROR: The boot volume size for windows instance %s is less than 256GB which is not permitted. Please add a boot volume size of 256GB or more", instance.hostname))]
#   linux_block_volumes     = [for block in var.bv_params : block.bv_size >= 50 && block.bv_size <= 32768 ? null : file(format("\n\nERROR: Block volume size %s for block volume %s should be between 50GB and 32768GB", block.bv_size, block.display_name))]
#   windows_block_volumes   = [for block in var.win_bv_params : block.bv_size >= 50 && block.bv_size <= 32768 ? null : file(format("\n\nERROR: Block volume size %s for block volume %s should be between 50GB and 32768GB", block.bv_size, block.display_name))]
#   block_performance       = {
#     Low      = "0"
#     Balanced = "10"
#     High     = "20"
#   }
# }

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ids[var.instance_params[keys(var.instance_params)[0]].compartment_name]
}

data "template_file" "block_volumes_templates" {
  for_each = var.instance_params
  template = file("${path.module}/../../userdata/fss_replication_dest.sh")

  vars = {
    length               = (length(split(" ", each.value.device_disk_mappings)) - 1)
    device_disk_mappings = each.value.device_disk_mappings
    block_vol_att_type   = each.value.block_vol_att_type

    ssh_private_key                    = file(each.value.ssh_private_key)
    src_mount_path                     = each.value.src_mount_path
    dst_mount_path_second              = each.value.dst_mount_path_second
    dst_export_path_second             = each.value.dst_export_path_second
    dst_mount_target_private_ip_second = var.mount_targets_src[each.value.dst_second_mount_name]
    data_sync_frequency                = each.value.data_sync_frequency
    src_public_ip                      = var.src_instance_pip[each.value.source_instance_name]
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
