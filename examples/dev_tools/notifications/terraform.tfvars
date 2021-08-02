// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartments = {
    sandbox = "ocid1..."
}

topic_params = {
    topic1 = {
        comp_name   = "sandbox"
        topic_name  = "topic1"
        description = "test topic"
    }
}

subscription_params = {
    subscription1 = {
        comp_name  = "sandbox"
        endpoint   = "testemail@test.com"
        protocol   = "EMAIL"
        topic_name = "topic1"
    }
}
