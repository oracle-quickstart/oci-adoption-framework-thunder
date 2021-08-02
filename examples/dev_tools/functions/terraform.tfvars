// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

compartment_ids = {
  db_rampup = "ocid1...."
}

subnet_ids = {
  hur1prv  = "ocid1...."
  hur1pub  = "ocid1...."
  hur2priv = "ocid1...."
  hur2pub  = "ocid1...."
}

app_params = {
  thunder_app = {
    compartment_name = "db_rampup"
    subnet_name      = ["hur1pub", "hur1prv"]
    display_name     = "thunder_app"
    config = {
      "MY_FUNCTION_CONFIG" : "ConfVal"
    }
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
  }
}

fn_params = {
  thunder_fn = {
    function_app       = "thunder_app"
    display_name       = "helloworld-func"
    image              = "lhr.ocir.io/isvglobal/thunder/helloworld-func:0.0.6"
    memory_in_mbs      = 256
    image_digest       = "sha256:0b5a80cb5957462bae6e438cfcc676394bf6fa9978c6352f4b0f654d7261b4e3"
    timeout_in_seconds = 30
    config = {
      "MY_FUNCTION_CONFIG" : "ConfVal"
    }
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
  }
  thunder_fn2 = {
    function_app       = "thunder_app"
    display_name       = "fun-func"
    image              = "lhr.ocir.io/isvglobal/thunder/fun:0.1"
    memory_in_mbs      = 128
    image_digest       = "sha256:c929fcadacd4873379f01219584249c03947feb194882e8d132171b38bd292a8"
    timeout_in_seconds = 30
    config = {
      "MY_FUNCTION_CONFIG" : "ConfVal"
    }
    freeform_tags = {
      "client" : "hurricane",
      "department" : "hurricane"
    }
  }
}
