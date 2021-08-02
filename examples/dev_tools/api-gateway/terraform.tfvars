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

function_ids = {
  helloworld-func = "ocid1...."
}

apigw_params = {
  apigw = {
    compartment_name = "db_rampup"
    endpoint_type    = "PUBLIC"
    subnet_name      = "hur1pub"
    display_name     = "test_apigw"
  }
}


gwdeploy_params = {
  api_deploy1 = {
    compartment_name = "db_rampup"
    gateway_name     = "apigw"
    display_name     = "tf_deploy"
    path_prefix      = "/tf"
    access_log       = true
    exec_log_lvl     = "WARN"

    function_routes = [
      {
        type          = "function"
        path          = "/func"
        methods       = ["GET", ]
        function_name = "helloworld-func"
      },
    ]
    http_routes = [
      {
        type            = "http"
        path            = "/http"
        methods         = ["GET", ]
        url             = "http://152.67.128.232/"
        ssl_verify      = true
        connect_timeout = 60
        read_timeout    = 40
        send_timeout    = 10
      },
    ]
    stock_routes = [
      {
        methods = ["GET", ]
        path    = "/stock"
        type    = "stock_response"
        status  = 200
        body    = "The API GW deployment was successful."
        headers = [
          {
            name  = "Content-Type"
            value = "text/plain"
          },
        ]

      },
    ]

  }
}
