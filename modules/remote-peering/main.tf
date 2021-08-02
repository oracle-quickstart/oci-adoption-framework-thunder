// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

terraform {
  required_providers {
    oci = {
      configuration_aliases = [oci.requestor, oci.acceptor]
    }
  }
}

resource "oci_core_drg" "requestor_drg" {
  count          = var.requestor_region == var.acceptor_region ? 0 : 1
  provider       = oci.requestor
  compartment_id = var.compartment_ids[var.rpg_params[count.index].compartment_name]
}

resource "oci_core_drg_attachment" "requestor_drg_attachment" {
  count    = var.requestor_region == var.acceptor_region ? 0 : 1
  provider = oci.requestor
  drg_id   = oci_core_drg.requestor_drg[0].id
  vcn_id   = var.vcns[var.rpg_params[count.index].vcn_name_requestor].id
}

resource "oci_core_remote_peering_connection" "requestor" {
  count            = var.requestor_region == var.acceptor_region ? 0 : 1
  provider         = oci.requestor
  compartment_id   = var.compartment_ids[var.rpg_params[count.index].compartment_name]
  drg_id           = oci_core_drg.requestor_drg[0].id
  display_name     = "remotePeeringConnectionRequestor"
  peer_id          = oci_core_remote_peering_connection.acceptor[0].id
  peer_region_name = var.acceptor_region
}

resource "oci_core_drg" "acceptor_drg" {
  count          = var.requestor_region == var.acceptor_region ? 0 : 1
  provider       = oci.acceptor
  compartment_id = var.compartment_ids[var.rpg_params[count.index].compartment_name]
}

resource "oci_core_drg_attachment" "acceptor_drg_attachment" {
  count    = var.requestor_region == var.acceptor_region ? 0 : 1
  provider = oci.acceptor
  drg_id   = oci_core_drg.acceptor_drg[0].id
  vcn_id   = var.vcns2[var.rpg_params[count.index].vcn_name_acceptor].id
}

resource "oci_core_remote_peering_connection" "acceptor" {
  count          = var.requestor_region == var.acceptor_region ? 0 : 1
  provider       = oci.acceptor
  compartment_id = var.compartment_ids[var.rpg_params[count.index].compartment_name]
  drg_id         = oci_core_drg.acceptor_drg[0].id
  display_name   = "remotePeeringConnectionAcceptor"
}

resource "null_resource" "remote_peering_rt_sl_rules" {
  count      = var.requestor_region == var.acceptor_region ? 0 : 1
  depends_on = [oci_core_remote_peering_connection.requestor]

  triggers = {
   req_compartment = var.compartment_ids[var.rpg_params[count.index].compartment_name]
   req_vcn_id = var.vcns[var.rpg_params[count.index].vcn_name_requestor].id
   req_drg = oci_core_drg.requestor_drg[0].id
   req_cidr = var.vcns[var.rpg_params[count.index].vcn_name_requestor].cidr
   acc_cidr = var.vcns2[var.rpg_params[count.index].vcn_name_acceptor].cidr
   acc_compartment = var.compartment_ids[var.rpg_params[count.index].compartment_name]
   acc_vcn_id = var.vcns2[var.rpg_params[count.index].vcn_name_acceptor].id
   acc_drg = oci_core_drg.acceptor_drg[0].id
   tfvars_file = format("%s/%s", path.root, var.provider_path)
  }

##### Add the DRG rules to the routing tables and security list

  provisioner "local-exec" {
    command = <<CMD
    python3 ../../../${path.root}/userdata/peering_rules.py \
    -req_compartment ${self.triggers.req_compartment} \
    -req_vcn_id ${self.triggers.req_vcn_id} \
    -req_drg ${self.triggers.req_drg} \
    -req_cidr ${self.triggers.req_cidr} \
    -acc_cidr ${self.triggers.acc_cidr} \
    -acc_compartment ${self.triggers.acc_compartment} \
    -acc_vcn_id ${self.triggers.acc_vcn_id} \
    -acc_drg ${self.triggers.acc_drg} \
    -tfvars_file ${self.triggers.tfvars_file} \
    -action add
CMD

    when = create
  }


##### Remove the DRG rules from the routing tables and security lists

  provisioner "local-exec" {
    command = <<CMD
    python3 ../../../${path.root}/userdata/peering_rules.py \
    -req_compartment ${self.triggers.req_compartment} \
    -req_vcn_id ${self.triggers.req_vcn_id} \
    -req_drg ${self.triggers.req_drg} \
    -req_cidr ${self.triggers.req_cidr} \
    -acc_cidr ${self.triggers.acc_cidr} \
    -acc_compartment ${self.triggers.acc_compartment} \
    -acc_vcn_id ${self.triggers.acc_vcn_id} \
    -acc_drg ${self.triggers.acc_drg} \
    -tfvars_file ${self.triggers.tfvars_file} \
    -action remove
CMD

    when = destroy
  }
}
