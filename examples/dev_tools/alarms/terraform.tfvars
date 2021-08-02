// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartments = {
    sandbox = "ocid1..."
}

topics = {
    topic1 = "ocid1..."
}

alarm_params = {
    alarm1 = {
        comp_name                              = "sandbox"
        destinations                           = ["topic1"]
        alarm_display_name                     = "alarm1"
        alarm_is_enabled                       = true
        alarm_metric_comp_name                 = "sandbox"
        alarm_namespace                        = "oci_computeagent"
        alarm_query                            = "CpuUtilization[1m]{resourceDisplayName = \"Flavius-dev\"}.absent()"
        alarm_severity                         = "WARNING"
        alarm_body                             = "Oops. Something went mega wrong with this"
        alarm_metric_compartment_id_in_subtree = false
        alarm_pending_duration                 = null
        alarm_repeat_notification_duration     = null
        alarm_resolution                       = null
        alarm_resource_group                   = null
        suppression_params                      = []
    }
}