// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

events_params = {
  "lz-notify-on-iam-changes-rule" = {
    rule_display_name = "lz-notify-on-iam-changes-rule"
    rule_is_enabled   = true
    compartment_name  = "tenancy"
    freeform_tags     = {}
    action_params = [{
      action_type         = "ONS"
      actions_description = "Sends notification via ONS"
      function_name       = ""
      is_enabled          = true
      stream_name         = ""
      topic_name          = "lz-security-topic"
    }]
    condition = {
      "eventType" : ["com.oraclecloud.identitycontrolplane.createidentityprovider",
        "com.oraclecloud.identitycontrolplane.deleteidentityprovider",
        "com.oraclecloud.identitycontrolplane.updateidentityprovider",
        "com.oraclecloud.identitycontrolplane.createidpgroupmapping",
        "com.oraclecloud.identitycontrolplane.deleteidpgroupmapping",
        "com.oraclecloud.identitycontrolplane.updateidpgroupmapping",
        "com.oraclecloud.identitycontrolplane.addusertogroup",
        "com.oraclecloud.identitycontrolplane.creategroup",
        "com.oraclecloud.identitycontrolplane.deletegroup",
        "com.oraclecloud.identitycontrolplane.removeuserfromgroup",
        "com.oraclecloud.identitycontrolplane.updategroup",
        "com.oraclecloud.identitycontrolplane.createpolicy",
        "com.oraclecloud.identitycontrolplane.deletepolicy",
        "com.oraclecloud.identitycontrolplane.updatepolicy",
        "com.oraclecloud.identitycontrolplane.createuser",
        "com.oraclecloud.identitycontrolplane.deleteuser",
        "com.oraclecloud.identitycontrolplane.updateuser",
        "com.oraclecloud.identitycontrolplane.updateusercapabilities",
      "com.oraclecloud.identitycontrolplane.updateuserstate"]
    }

  },
  "lz-notify-on-network-changes-rule" = {
    rule_display_name = "lz-notify-on-network-changes-rule"
    rule_is_enabled   = true
    compartment_name  = "lz-top-cmp"
    freeform_tags     = {}
    action_params = [{
      action_type         = "ONS"
      actions_description = "Sends notification via ONS"
      function_name       = ""
      is_enabled          = true
      stream_name         = ""
      topic_name          = "lz-network-topic"
    }]
    condition = {
      "eventType" : ["com.oraclecloud.virtualnetwork.createvcn",
        "com.oraclecloud.virtualnetwork.deletevcn",
        "com.oraclecloud.virtualnetwork.updatevcn",
        "com.oraclecloud.virtualnetwork.createroutetable",
        "com.oraclecloud.virtualnetwork.deleteroutetable",
        "com.oraclecloud.virtualnetwork.updateroutetable",
        "com.oraclecloud.virtualnetwork.changeroutetablecompartment",
        "com.oraclecloud.virtualnetwork.createsecuritylist",
        "com.oraclecloud.virtualnetwork.deletesecuritylist",
        "com.oraclecloud.virtualnetwork.updatesecuritylist",
        "com.oraclecloud.virtualnetwork.changesecuritylistcompartment",
        "com.oraclecloud.virtualnetwork.createnetworksecuritygroup",
        "com.oraclecloud.virtualnetwork.deletenetworksecuritygroup",
        "com.oraclecloud.virtualnetwork.updatenetworksecuritygroup",
        "com.oraclecloud.virtualnetwork.updatenetworksecuritygroupsecurityrules",
        "com.oraclecloud.virtualnetwork.changenetworksecuritygroupcompartment",
        "com.oraclecloud.virtualnetwork.createdrg",
        "com.oraclecloud.virtualnetwork.deletedrg",
        "com.oraclecloud.virtualnetwork.updatedrg",
        "com.oraclecloud.virtualnetwork.createdrgattachment",
        "com.oraclecloud.virtualnetwork.deletedrgattachment",
        "com.oraclecloud.virtualnetwork.updatedrgattachment",
        "com.oraclecloud.virtualnetwork.createinternetgateway",
        "com.oraclecloud.virtualnetwork.deleteinternetgateway",
        "com.oraclecloud.virtualnetwork.updateinternetgateway",
        "com.oraclecloud.virtualnetwork.changeinternetgatewaycompartment",
        "com.oraclecloud.virtualnetwork.createlocalpeeringgateway",
        "com.oraclecloud.virtualnetwork.deletelocalpeeringgateway",
        "com.oraclecloud.virtualnetwork.updatelocalpeeringgateway",
        "com.oraclecloud.virtualnetwork.changelocalpeeringgatewaycompartment",
        "com.oraclecloud.natgateway.createnatgateway",
        "com.oraclecloud.natgateway.deletenatgateway",
        "com.oraclecloud.natgateway.updatenatgateway",
        "com.oraclecloud.natgateway.changenatgatewaycompartment",
        "com.oraclecloud.servicegateway.createservicegateway",
        "com.oraclecloud.servicegateway.deleteservicegateway.begin",
        "com.oraclecloud.servicegateway.deleteservicegateway.end",
        "com.oraclecloud.servicegateway.attachserviceid",
        "com.oraclecloud.servicegateway.detachserviceid",
        "com.oraclecloud.servicegateway.updateservicegateway",
        "com.oraclecloud.servicegateway.changeservicegatewaycompartment"
      ]
    }

  }
}

