// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

images = {
  ap-mumbai-1    = "ocid1...."
  ap-seoul-1     = "ocid1...."
  ap-sydney-1    = "ocid1...."
  ap-tokyo-1     = "ocid1...."
  ca-toronto-1   = "ocid1...."
  eu-frankfurt-1 = "ocid1...."
  eu-zurich-1    = "ocid1...."
  sa-saopaulo-1  = "ocid1...."
  uk-london-1    = "ocid1...."
  us-ashburn-1   = "ocid1...."
  us-langley-1   = "ocid1...."
  us-luke-1      = "ocid1...."
  us-phoenix-1   = "ocid1...."
}

instance_params = {
  ad                   = "1"
  shape                = "VM.Standard2.8"
  hostname             = "grafana"
  assign_public_ip     = "true"
  boot_volume_size     = "120"
  source_type          = "image"
  preserve_boot_volume = 1
  subnet_id            = "ocid1...."
  compartment_id       = "ocid1...."
}

ssh_public_key  = "/root/.ssh/id_rsa.pub"
ssh_private_key = "/root/.ssh/id_rsa"

instance_principal_params = {
  dg_description     = "Dynamic Group used for creating an instance principal for Grafana"
  dg_name            = "GrafanaGroup"
  policy_description = "Policy used for creating an instance principal"
  policy_name        = "policy_grafana"
}
