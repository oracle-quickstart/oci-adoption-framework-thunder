// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

policy_params = {
  "lz-top-cmp-provisioning-root-policy" = {
    name             = "lz-top-cmp-provisioning-root-policy"
    description      = "Landing Zone provisioning policy."
    compartment_name = ""
    statements = ["Allow group lz-top-cmp-provisioning-group to read objectstorage-namespaces in tenancy", # ability to query for object store namespace for creating buckets
      "Allow group lz-top-cmp-provisioning-group to use tag-namespaces in tenancy",                        # ability to check the tag-namespaces at the tenancy level and to apply tag defaults
      "Allow group lz-top-cmp-provisioning-group to read tag-defaults in tenancy",                         # ability to check for tag-defaults at the tenancy level
      "Allow group lz-top-cmp-provisioning-group to manage cloudevents-rules in tenancy",                  # for events: create IAM event rules at the tenancy level 
      "Allow group lz-top-cmp-provisioning-group to inspect compartments in tenancy",                      # for events: access to resources in compartments to select rules actions
      "Allow group lz-top-cmp-provisioning-group to manage cloud-guard-family in tenancy",                 # ability to enable Cloud Guard, which can be done only at the tenancy level
      "Allow group lz-top-cmp-provisioning-group to read groups in tenancy",                               # for groups lookup 
      "Allow group lz-top-cmp-provisioning-group to inspect tenancies in tenancy",                         # for home region lookup
      "Allow group lz-top-cmp-provisioning-group to inspect users in tenancy"                              # for users lookup
    ]
  },
  "lz-top-cmp-provisioning-policy" = {
    name             = "lz-top-cmp-provisioning-policy"
    description      = "Landing Zone provisioning policy for lz-top-cmp compartment."
    compartment_name = ""
    statements       = ["Allow group lz-top-cmp-provisioning-group to manage all-resources in compartment lz-top-cmp"]
  }
}




policy_params2 = {
  "lz-mgmt-root-policy" = {
    name             = "lz-mgmt-root-policy"
    description      = "Landing Zone groups management root policy."
    compartment_name = ""
    statements = ["Allow group lz-security-admin-group to manage cloudevents-rules in tenancy",
      "Allow group lz-security-admin-group to manage tag-namespaces in tenancy",
      "Allow group lz-security-admin-group to manage tag-defaults in tenancy",
      "Allow group lz-security-admin-group to manage cloud-guard-family in tenancy",
      "Allow group lz-security-admin-group to manage repos in tenancy",
      "Allow group lz-cred-admin-group to manage users in tenancy where any {request.operation = 'ListApiKeys', request.operation = 'ListAuthTokens', request.operation = 'ListCustomerSecretKeys', request.operation = 'UploadApiKey', request.operation = 'DeleteApiKey', request.operation = 'UpdateAuthToken', request.operation = 'CreateAuthToken', request.operation = 'DeleteAuthToken', request.operation = 'CreateSecretKey', request.operation = 'UpdateCustomerSecretKey', request.operation = 'DeleteCustomerSecretKey', request.operation = 'UpdateUserCapabilities'}",
      "Allow group lz-iam-admin-group to manage groups in tenancy where all {target.group.name != 'Administrators', target.group.name != 'lz-cred-admin-group'}"
    ]
  },
  "lz-read-only-root-policy" = {
    name             = "lz-read-only-root-policy"
    description      = "Landing Zone groups read-only root policy."
    compartment_name = ""
    statements = ["Allow group lz-security-admin-group to read audit-events in tenancy",
      "Allow group lz-security-admin-group to read tenancies in tenancy",
      "Allow group lz-security-admin-group to read objectstorage-namespaces in tenancy",
      "Allow group lz-security-admin-group to read app-catalog-listing in tenancy",
      "Allow group lz-security-admin-group to read instance-images in tenancy",
      "Allow group lz-security-admin-group to inspect buckets in tenancy",
      "Allow group lz-security-admin-group to use cloud-shell in tenancy",
      "Allow group lz-appdev-admin-group to read repos in tenancy",
      "Allow group lz-appdev-admin-group to read objectstorage-namespaces in tenancy",
      "Allow group lz-appdev-admin-group to read app-catalog-listing in tenancy",
      "Allow group lz-appdev-admin-group to read instance-images in tenancy",
      "Allow group lz-appdev-admin-group to use cloud-shell in tenancy",
      "Allow group lz-network-admin-group to read repos in tenancy",
      "Allow group lz-network-admin-group to read objectstorage-namespaces in tenancy",
      "Allow group lz-network-admin-group to read app-catalog-listing in tenancy",
      "Allow group lz-network-admin-group to read instance-images in tenancy",
      "Allow group lz-network-admin-group to use cloud-shell in tenancy",
      "Allow group lz-database-admin-group to read repos in tenancy",
      "Allow group lz-database-admin-group to read objectstorage-namespaces in tenancy",
      "Allow group lz-database-admin-group to read app-catalog-listing in tenancy",
      "Allow group lz-database-admin-group to read instance-images in tenancy",
      "Allow group lz-database-admin-group to use cloud-shell in tenancy",
      "Allow group lz-cred-admin-group to inspect users in tenancy",
      "Allow group lz-cred-admin-group to inspect groups in tenancy",
      "Allow group lz-cred-admin-group to use cloud-shell in tenancy",
      "Allow group lz-iam-admin-group to inspect users in tenancy",
      "Allow group lz-iam-admin-group to inspect groups in tenancy",
      "Allow group lz-iam-admin-group to inspect identity-providers in tenancy",
      "Allow group lz-iam-admin-group to read audit-events in tenancy",
      "Allow group lz-iam-admin-group to use cloud-shell in tenancy",
      "Allow group lz-auditor-group to read repos in tenancy",
      "Allow group lz-auditor-group to read objectstorage-namespaces in tenancy",
      "Allow group lz-auditor-group to read app-catalog-listing in tenancy",
      "Allow group lz-auditor-group to read instance-images in tenancy",
      "Allow group lz-auditor-group to read users in tenancy",
      "Allow group lz-auditor-group to inspect buckets in tenancy",
      "Allow group lz-auditor-group to use cloud-shell in tenancy",
      "Allow group lz-announcement-reader-group to read announcements in tenancy",
      "Allow group lz-announcement-reader-group to use cloud-shell in tenancy"
    ]
  },
  "lz-security-admin-root-policy" = {
    name             = "lz-security-admin-root-policy"
    description      = "Landing Zone lz-security-admin-group's root compartment policy."
    compartment_name = ""
    statements = ["Allow group lz-security-admin-group to manage cloudevents-rules in tenancy",
      "Allow group lz-security-admin-group to manage cloud-guard-family in tenancy",
      "Allow group lz-security-admin-group to read tenancies in tenancy",
      "Allow group lz-security-admin-group to read objectstorage-namespaces in tenancy",
      "Allow group lz-security-admin-group to use cloud-shell in tenancy"
    ]
  },
  "lz-iam-admin-root-policy" = {
    name             = "lz-iam-admin-root-policy"
    description      = "Landing Zone lz-iam-admin-group's root compartment policy."
    compartment_name = ""
    statements = ["Allow group lz-iam-admin-group to inspect users in tenancy",
      "Allow group lz-iam-admin-group to inspect groups in tenancy",
      "Allow group lz-iam-admin-group to manage groups in tenancy where all {target.group.name != 'Administrators', target.group.name != 'lz-cred-admin-group'}",
      "Allow group lz-iam-admin-group to inspect identity-providers in tenancy",
      "Allow group lz-iam-admin-group to manage identity-providers in tenancy where any {request.operation = 'AddIdpGroupMapping', request.operation = 'DeleteIdpGroupMapping'}",
      "Allow group lz-iam-admin-group to manage dynamic-groups in tenancy",
      "Allow group lz-iam-admin-group to manage authentication-policies in tenancy",
      "Allow group lz-iam-admin-group to manage network-sources in tenancy",
      "Allow group lz-iam-admin-group to manage quota in tenancy",
      "Allow group lz-iam-admin-group to read audit-events in tenancy",
      "Allow group lz-iam-admin-group to use cloud-shell in tenancy"
    ]
  },
  "lz-network-admin-root-policy" = {
    name             = "lz-network-admin-root-policy"
    description      = "Landing Zone lz-network-admin-group's root compartment policy."
    compartment_name = ""
    statements       = ["Allow group lz-network-admin-group to use cloud-shell in tenancy"]
  },
  "lz-appdev-admin-root-policy" = {
    name             = "lz-appdev-admin-root-policy"
    description      = "Landing Zone lz-appdev-admin-group's root compartment policy."
    compartment_name = ""
    statements       = ["Allow group lz-appdev-admin-group to use cloud-shell in tenancy"]
  },
  "lz-database-admin-root-policy" = {
    name             = "lz-database-admin-root-policy"
    description      = "Landing Zone lz-database-admin-group's root compartment policy."
    compartment_name = ""
    statements       = ["Allow group lz-database-admin-group to use cloud-shell in tenancy"]
  },
  "lz-auditor-policy" = {
    name             = "lz-auditor-policy"
    description      = "Landing Zone lz-auditor-group's root compartment policy."
    compartment_name = ""
    statements = ["Allow group lz-auditor-group to inspect all-resources in tenancy",
      "Allow group lz-auditor-group to read instances in tenancy",
      "Allow group lz-auditor-group to read load-balancers in tenancy",
      "Allow group lz-auditor-group to read buckets in tenancy",
      "Allow group lz-auditor-group to read nat-gateways in tenancy",
      "Allow group lz-auditor-group to read public-ips in tenancy",
      "Allow group lz-auditor-group to read file-family in tenancy",
      "Allow group lz-auditor-group to read instance-configurations in tenancy",
      "Allow Group lz-auditor-group to read network-security-groups in tenancy",
      "Allow Group lz-auditor-group to read resource-availability in tenancy",
      "Allow Group lz-auditor-group to read audit-events in tenancy",
      "Allow Group lz-auditor-group to read users in tenancy",
      "Allow Group lz-auditor-group to use cloud-shell in tenancy",
      "Allow Group lz-auditor-group to read vss-family in tenancy"
    ]
  },
  "lz-announcement-reader-policy" = {
    name             = "lz-announcement-reader-policy"
    description      = "Landing Zone lz-announcement-reader-group's root compartment policy."
    compartment_name = ""
    statements = ["Allow group lz-announcement-reader-group to read announcements in tenancy",
      "Allow group lz-announcement-reader-group to use cloud-shell in tenancy"
    ]
  },
  "lz-credential-admin-policy" = {
    name             = "lz-credential-admin-policy"
    description      = "Landing Zone lz-cred-admin-group's root compartment policy."
    compartment_name = ""
    statements = ["Allow group lz-cred-admin-group to inspect users in tenancy",
      "Allow group lz-cred-admin-group to inspect groups in tenancy",
      "Allow group lz-cred-admin-group to manage users in tenancy  where any {request.operation = 'ListApiKeys',request.operation = 'ListAuthTokens',request.operation = 'ListCustomerSecretKeys',request.operation = 'UploadApiKey',request.operation = 'DeleteApiKey',request.operation = 'UpdateAuthToken',request.operation = 'CreateAuthToken',request.operation = 'DeleteAuthToken',request.operation = 'CreateSecretKey',request.operation = 'UpdateCustomerSecretKey',request.operation = 'DeleteCustomerSecretKey',request.operation = 'UpdateUserCapabilities'}",
      "Allow group lz-cred-admin-group to use cloud-shell in tenancy"
    ]
  },
  "lz-network-admin-policy" = {
    name             = "lz-network-admin-policy"
    description      = "Landing Zone policy for lz-network-admin-group group to manage network related services."
    compartment_name = "lz-top-cmp"
    statements = ["Allow group lz-network-admin-group to read all-resources in compartment lz-network-cmp",
      "Allow group lz-network-admin-group to manage virtual-network-family in compartment lz-network-cmp",
      "Allow group lz-network-admin-group to manage dns in compartment lz-network-cmp",
      "Allow group lz-network-admin-group to manage load-balancers in compartment lz-network-cmp",
      "Allow group lz-network-admin-group to manage alarms in compartment lz-network-cmp",
      "Allow group lz-network-admin-group to manage metrics in compartment lz-network-cmp",
      "Allow group lz-network-admin-group to manage orm-stacks in compartment lz-network-cmp",
      "Allow group lz-network-admin-group to manage orm-jobs in compartment lz-network-cmp",
      "Allow group lz-network-admin-group to manage orm-config-source-providers in compartment lz-network-cmp",
      "Allow Group lz-network-admin-group to read audit-events in compartment lz-network-cmp",
      "Allow Group lz-network-admin-group to read vss-family in compartment lz-security-cmp"
    ]
  },
  "lz-security-admin-policy" = {
    name             = "lz-security-admin-policy"
    description      = "Landing Zone policy for lz-security-admin-group group to manage security related services in Landing Zone enclosing compartment (lz-top-cmp)."
    compartment_name = "lz-top-cmp"
    statements = ["Allow group lz-security-admin-group to manage tag-namespaces in compartment lz-top-cmp",
      "Allow group lz-security-admin-group to manage tag-defaults in compartment lz-top-cmp",
      "Allow group lz-security-admin-group to manage repos in compartment lz-top-cmp",
      "Allow group lz-security-admin-group to read audit-events in compartment lz-top-cmp",
      "Allow group lz-security-admin-group to read app-catalog-listing in compartment lz-top-cmp",
      "Allow group lz-security-admin-group to read instance-images in compartment lz-top-cmp",
      "Allow group lz-security-admin-group to inspect buckets in compartment lz-top-cmp",
      "Allow group lz-security-admin-group to read all-resources in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage instance-family in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage vaults in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage keys in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage secret-family in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage logging-family in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage serviceconnectors in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage streams in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage ons-family in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage functions-family in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage waas-family in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage security-zone in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to read virtual-network-family in compartment lz-network-cmp",
      "Allow group lz-security-admin-group to use subnets in compartment lz-network-cmp",
      "Allow group lz-security-admin-group to use network-security-groups in compartment lz-network-cmp",
      "Allow group lz-security-admin-group to use vnics in compartment lz-network-cmp",
      "Allow group lz-security-admin-group to manage orm-stacks in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage orm-jobs in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage orm-config-source-providers in compartment lz-security-cmp",
      "Allow group lz-security-admin-group to manage vss-family in compartment lz-security-cmp"
    ]
  },
  "lz-database-admin-policy" = {
    name             = "lz-database-admin-policy"
    description      = "Landing Zone policy for lz-database-admin-group group to manage database related resources."
    compartment_name = "lz-top-cmp"
    statements = ["Allow group lz-database-admin-group to read all-resources in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to manage database-family in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to manage autonomous-database-family in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to manage alarms in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to manage metrics in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to manage object-family in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to use vnics in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to use subnets in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to use network-security-groups in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to read virtual-network-family in compartment lz-network-cmp",
      "Allow group lz-database-admin-group to use vnics in compartment lz-network-cmp",
      "Allow group lz-database-admin-group to use subnets in compartment lz-network-cmp",
      "Allow group lz-database-admin-group to use network-security-groups in compartment lz-network-cmp",
      "Allow group lz-database-admin-group to manage orm-stacks in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to manage orm-jobs in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to manage orm-config-source-providers in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to read audit-events in compartment lz-database-cmp",
      "Allow group lz-database-admin-group to read vss-family in compartment lz-security-cmp",
      "Allow group lz-database-admin-group to read vaults in compartment lz-security-cmp",
      "Allow group lz-database-admin-group to inspect keys in compartment lz-security-cmp"
    ]
  },
  "lz-appdev-admin-policy" = {
    name             = "lz-appdev-admin-policy"
    description      = "Landing Zone policy for lz-appdev-admin-group group to manage app development related services."
    compartment_name = "lz-top-cmp"
    statements = ["Allow group lz-appdev-admin-group to read all-resources in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage functions-family in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage api-gateway-family in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage ons-family in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage streams in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage cluster-family in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage alarms in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage metrics in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage logs in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage instance-family in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage volume-family in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage object-family in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to read virtual-network-family in compartment lz-network-cmp",
      "Allow group lz-appdev-admin-group to use subnets in compartment lz-network-cmp",
      "Allow group lz-appdev-admin-group to use network-security-groups in compartment lz-network-cmp",
      "Allow group lz-appdev-admin-group to use vnics in compartment lz-network-cmp",
      "Allow group lz-appdev-admin-group to use load-balancers in compartment lz-network-cmp",
      "Allow group lz-appdev-admin-group to read autonomous-database-family in compartment lz-database-cmp",
      "Allow group lz-appdev-admin-group to read database-family in compartment lz-database-cmp",
      "Allow group lz-appdev-admin-group to read vaults in compartment lz-security-cmp",
      "Allow group lz-appdev-admin-group to inspect keys in compartment lz-security-cmp",
      "Allow group lz-appdev-admin-group to read app-catalog-listing in compartment lz-top-cmp",
      "Allow group lz-appdev-admin-group to manage instance-images in compartment lz-security-cmp",
      "Allow group lz-appdev-admin-group to read instance-images in compartment lz-top-cmp",
      "Allow group lz-appdev-admin-group to manage repos in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to read repos in compartment lz-top-cmp",
      "Allow group lz-appdev-admin-group to manage orm-stacks in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage orm-jobs in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to manage orm-config-source-providers in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to read audit-events in compartment lz-appdev-cmp",
      "Allow group lz-appdev-admin-group to read vss-family in compartment lz-security-cmp"
    ]
  },
  "lz-iam-admin-policy" = {
    name             = "lz-iam-admin-policy"
    description      = "Landing Zone policy for lz-iam-admin-group group to manage IAM resources in Landing Zone enclosing compartment (lz-top-cmp)."
    compartment_name = "lz-top-cmp"
    statements = ["Allow group lz-iam-admin-group to manage policies in compartment lz-top-cmp",
      "Allow group lz-iam-admin-group to manage compartments in compartment lz-top-cmp",
      "Allow group lz-iam-admin-group to manage tag-defaults in compartment lz-top-cmp",
      "Allow group lz-iam-admin-group to manage tag-namespaces in compartment lz-top-cmp",
      "Allow group lz-iam-admin-group to manage orm-stacks in compartment lz-top-cmp",
      "Allow group lz-iam-admin-group to manage orm-jobs in compartment lz-top-cmp",
      "Allow group lz-iam-admin-group to manage orm-config-source-providers in compartment lz-top-cmp"
    ]
  },
  "lz-services-policy" = {
    name             = "lz-services-policy"
    description      = "Landing Zone policy for OCI services: Cloud Guard, Vulnerability Scanning and OS Management."
    compartment_name = ""
    statements = ["Allow service cloudguard to read keys in tenancy",
      "Allow service cloudguard to read compartments in tenancy",
      "Allow service cloudguard to read tenancies in tenancy",
      "Allow service cloudguard to read audit-events in tenancy",
      "Allow service cloudguard to read compute-management-family in tenancy",
      "Allow service cloudguard to read instance-family in tenancy",
      "Allow service cloudguard to read virtual-network-family in tenancy",
      "Allow service cloudguard to read volume-family in tenancy",
      "Allow service cloudguard to read database-family in tenancy",
      "Allow service cloudguard to read object-family in tenancy",
      "Allow service cloudguard to read load-balancers in tenancy",
      "Allow service cloudguard to read users in tenancy",
      "Allow service cloudguard to read groups in tenancy",
      "Allow service cloudguard to read policies in tenancy",
      "Allow service cloudguard to read dynamic-groups in tenancy",
      "Allow service cloudguard to read authentication-policies in tenancy",
      "Allow service cloudguard to use network-security-groups in tenancy",
      "Allow service vulnerability-scanning-service to manage instances in tenancy",
      "Allow service vulnerability-scanning-service to read compartments in tenancy",
      "Allow service vulnerability-scanning-service to read vnics in tenancy",
      "Allow service vulnerability-scanning-service to read vnic-attachments in tenancy",
      "Allow service osms to read instances in tenancy"
    ]
  },
}

