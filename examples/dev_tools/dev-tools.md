# Developer Tools

## Introduction
In this section you will learn how to use Oracle Container Engine for Kubernetes (OKE), API gateways and OCI Functions.

## Objectives
- Build OKE Clusters
- Build API Gateways
- Build OCI Functions

## Step 1 - OKE
Oracle Cloud Infrastructure Container Engine for Kubernetes is a fully-managed, scalable, and highly available service that you can use to deploy your containerized applications to the cloud. Use Container Engine for Kubernetes (sometimes abbreviated to just OKE) when your development team wants to reliably build, deploy, and manage cloud-native applications. You specify the compute resources that your applications require, and Container Engine for Kubernetes provisions them on Oracle Cloud Infrastructure in an existing OCI tenancy.

The example is located in `thunder->examples->dev-tools->containers`

### Resource Details

The result of this code runned successfully will generate:
* kubernetes cluster with nodepools, each nodepool having a minimum of one node

**Parameters**
  * OKE Cluster
    * compartment_name - The compartment name in which the OKE Cluster will be created
    * kubernetes_version - The version of kubernetes that will be used for this particular cluster
    * use_encryption - will specify if encryption will be used or not
    * kms\_key\_id - The id of the kms key
    * cluster_name - The name of the OKE cluster
    * vcn_name - The name of the vcn where OKE cluster will reside
    * is\_kubernetes\_dashboard\_enabled - Specifies if the dashboard will be enabled or not on kubernetes cluster
    * is\_tiller\_enabled - Specifies if the tiller will be enabled or not on kubernetes cluster
    * pods_cidr - cidr range  where the pods will be created on kubernetes cluster
    * services_cidr - cidr range  where services will reside on kubernetes cluster
    * service\_lb\_subnet\_names - Name of the subnet where load balancer service of the cluster will reside

  * Nodepool Parameters
    * compartment_name - The compartment name in which Nodepool will be created
    * cluster_name  - The name of the OKE cluster   
    * pool_name - The name of the OKE pool       
    * subnet_name - Name of the subnet where nodepool will be created     
    * size - Specifies the size of the nodepool           
    * node_shape - specifies the shape of the nodepool       
    * ssh\_public\_key  - The ssh public key for connecting to nodes
    * ad - availability domain for placement config where nodepool will be created    
    * subnet - The subnet where a node in a pool will be created

Apart from the **provider.auto.tfvars**, there may be some other dependencies in the **terraform.tfvars** file that you will have to address.
All the dependencies from this section should have resources that already exist in OCI.

For this module, you are going to have dependencies to some external resources:
- compartments
- subnets
- vcns

In order to address those, you will need to change the values of the variables accordingly in the **terraform.tfvars** file.


### Example
In the provided example, the following resources are created:

* 1 OKE Cluster
    * cluster1
* 3 NodePools
    * pool1
    * pool2
    * pool3

The example is based on terraform.tfvars values:
```
compartment_ids = {
    db_rampup = "ocid1.compartment.oc1.."

}

subnet_ids = {
  IPSEC2     = "ocid1.subnet.oc1.."
  okesubnet1 = "ocid1.subnet.oc1.."
  okesubnet2 = "ocid1.subnet.oc1.."
  okesubnet3 = "ocid1.subnet.oc1.."
}

vcn_ids = {
  IPSEC2 = "ocid1.vcn.oc1."
}

cluster_params = {
  cluster1 = {
    compartment_name                = "db_rampup"
    cluster_name                    = "cluster1"
    kubernetes_version              = "v1.15.7"
    use_encryption                  = false
    kms_key_id                      = ""
    vcn_name                        = "IPSEC2"
    is_kubernetes_dashboard_enabled = true
    is_tiller_enabled               = true
    pods_cidr                       = "10.244.0.0/16"
    services_cidr                   = "10.96.0.0/16"
    service_lb_subnet_names         = ["IPSEC2"]
  }
}

nodepools_params = {
  pool1 = {
    compartment_name = "db_rampup"
    cluster_name     = "cluster1"
    pool_name        = "pool1"
    subnet_name      = "okesubnet1"
    size             = 3
    node_shape       = "VM.Standard2.1"
    ssh_public_key   = "/root/.ssh/id_rsa.pub"
    placement_configs = [
      {
        ad     = 1
        subnet = "IPSEC2"
      },
      {
        ad     = 1
        subnet = "IPSEC2"
      },
      {
        ad     = 1
        subnet = "IPSEC2"
      },
    ]
}
  pool2 = {
    compartment_name = "db_rampup"
    cluster_name     = "cluster1"
    pool_name        = "pool2"
    subnet_name      = "okesubnet2"
    size             = 3
    node_shape       = "VM.Standard2.1"
    ssh_public_key   = "/root/.ssh/id_rsa.pub"
    placement_configs = [
    {
        ad     = 1
        subnet = "IPSEC2"
    },
    ]
  }
  pool3 = {
    compartment_name = "db_rampup"
    cluster_name     = "cluster1"
    pool_name        = "pool3"
    subnet_name      = "okesubnet3"
    size             = 3
    node_shape       = "VM.Standard2.1"
    ssh_public_key   = "/root/.ssh/id_rsa.pub"
    placement_configs = [
      {
      ad     = 1
      subnet = "IPSEC2"
    },
    ]
  }
}

linux_images = {
  # Oracle-Linux-7.7-2020.02.21-0
  # from https://docs.cloud.oracle.com/en-us/iaas/images/image/957e74db-0375-4918-b897-a8ce93753ad9/
  ap-melbourne-1  = "ocid1.image.oc1.."
  ap-mumbai-1     = "ocid1.image.oc1.."
  -----------------------------------------------
  us-ashburn-1    = "ocid1.image.oc1.."

  us-phoenix-1    = "ocid1.image.oc1.."
}
```

### Running the code

```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply --var-file=path_to_provider.auto.tfvars

# If you are done with this infrastructure, take it down
$ terraform destroy --var-file=path_to_provider.auto.tfvars
```



## Step 2 - API Gateway
An API Gateway routes inbound traffic to back-end services including public, private, and partner HTTP APIs, as well as Oracle Functions.
Each API gateway is a private endpoint that you can optionally expose over a public IP address as a public API gateway.
To ensure high availability, you can only create API gateways in regional subnets (not AD-specific subnets). You can create private API gateways in private or public subnets, but you can only create public API gateways in public subnets. An API gateway is bound to a specific VNIC.

You create an API gateway within a compartment in your tenancy. Each API gateway has a single front end, zero or more back ends, and has zero or more APIs deployed on it as API deployments.

The example is located in `thunder->examples->dev-tools->api_gateway`


### Description
This module will create API Gateways and API Deployments.
Please keep in mind that in the following Terraform configuration Request Policies

For more details about API Gateways and API Deployments, see:
https://docs.cloud.oracle.com/en-us/iaas/Content/APIGateway/Concepts/apigatewayconcepts.htm


The following parameters are supported:

* API Gateway parameters - Creates a new gateway. This resource provides the Gateway resource in Oracle Cloud Infrastructure API Gateway service.
    * compartment_name - The name of the compartment in which the API Gateway will be created
    * endpoint_type - Gateway endpoint type: public/private
    * display_name - The name of the API Gateway
    * subnet_name -  The name of the subnet in which related resources are created


* API Gateway Deployments

    * compartment_name - The name of the compartment in which the API Gateway Deployment will be created
    * gateway_name - The name of the API Gateway for this deplyment  
    * display_name - The name of the API Gateway Deployment
    * path_prefix - A path on which to deploy all routes contained in the API deployment specification
    * access_log - Enables pushing of access logs to Oracle Cloud Infrastructure Public Logging
    * exec\_log\_lvl - Enables pushing of execution logs to Oracle Cloud Infrastructure Public Logging if is not null (accepted values: "ERROR"/"WARNING/"INFO")
    * routes - This is the subsection of API Gateway Deployments where the backends are added as lists:
        * methods - A list of allowed methods on this route ("GET, PUT"..."ANY")
        * path - A URL path pattern that must be matched on this route. The path pattern may contain a subset of RFC 6570 identifiers to allow wildcard and parameterized matching
        * type - Type of the API backend (ORACLE\_FUNCTIONS\_BACKEND, HTTP\_BACKEND and STOCK\_RESPONSE\_BACKEND). For simplicity, the values are replaced with:
          - function       = "ORACLE\_FUNCTIONS\_BACKEND"
          - http           = "HTTP_BACKEND"
          - stock_response = "STOCK\_RESPONSE\_BACKEND"
        * function\_name - (type - function) The name of the Oracle Functions function resource, as provided in terraform.tfvars - function\_ids (null if type != function).
        * ssl\_verify - (type - http) Defines whether or not to uphold SSL verification.
        * connect_timeout - (type - http) Defines a timeout for establishing a connection with a proxied server. Should be 0 if the backend is not http type.
        * read_timeout - (type - http) Defines a timeout for reading a response from the proxied server.
        * send_timeout - (type - http) Defines a timeout for transmitting a request to the proxied server.
        * status - (type - stock_response) The status code of the stock response from the mock backend.
        * body - (type - stock_response) The body of the stock response from the mock backend.
        * headers - (type - stock_response) The headers of the stock response from the mock backend.
          * name - (type - stock_response) Name of the header.
          * value - (type - stock_response) Value of the header.


Apart from the **provider.auto.tfvars**, there may be some other dependencies in the **terraform.tfvars** file that you will have to address.
All the dependencies from this section should have resources that already exist in OCI.

For this module, you are going to have dependencies to some external resources:
- compartments
- functions

In order to address those, you will need to change the values of the variables accordingly in the **terraform.tfvars** file.

Below, you will see the dependencies and what variables need to be changed.

### Example

In the example, the following components are created:
* An API Gateway
* An API Gateway Deployment with three routes (one for each API backend type)
* One backend set
* One backend

The compartment\_ids will be external to the apigw\_params in order to offer multiple ways of linking them from a terraform perspective.
In the example from below, there is a list of compartments containing 1 element. By setting in apigw\_params and gwdeploy\_params `compartment_name` to sandbox,
the load balancer elements will be created the sandbox compartment `ocid1.compartment.oc1..`.
The same thing is happening for the subnet\_ids and function\_ids. All lists can be extended in order to satisfy your needs.

```
compartment_ids = {
  sandbox = "ocid1.compartment.oc1.."
}

function_ids = {
  helloworld-func = "ocid1.fnfunc.."
}

apigw_params = {
  apigw = {
    compartment_name = "sandbox"
    endpoint_type    = "PUBLIC"
    subnet_name      = "hur1pub"
    display_name     = "test_apigw"
  }
}


gwdeploy_params = {
  api_deploy1 = {
    compartment_name = "sandbox"
    gateway_name     = "apigw"
    display_name     = "tf_deploy"
    path_prefix      = "/tf"
    access_log       = true
    exec_log_lvl     = "WARN"

    routes = [
      {
        methods         = ["GET", ]
        path            = "/func"
        type            = "function"
        function_name   = "helloworld-func"
        ssl_verify      = true
        connect_timeout = 15
        read_timeout    = 0
        send_timeout    = 0
        url             = null
        status          = 200
        body            = null
        headers         = []
      },
      {
        methods         = ["GET", ]
        path            = "/http"
        type            = "http"
        function_name   = null
        ssl_verify      = true
        connect_timeout = 60
        read_timeout    = 40
        send_timeout    = 10
        url             = "http://instance-fntest.hur1pub.hur1.oraclevcn.com"
        body            = null
        status          = 200
        headers         = []
      },
      {
        methods         = ["GET", ]
        path            = "/stock"
        type            = "stock_response"
        function_name   = "test"
        url             = null
        ssl_verify      = false
        connect_timeout = 60
        read_timeout    = 0
        send_timeout    = 0
        status          = 200
        body            = "The API GW deployment was successful."
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
```

### Running the code

```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply --var-file=path\_to\_provider.auto.tfvars

# If you are done with this infrastructure, take it down
$ terraform destroy --var-file=path\_to\_provider.auto.tfvars
```



## Step 3 - Oracle Functions
The Functions module is able to create Applications and Functions in Oracle Cloud Infrastructure Functions service.
* In Oracle Functions, an application is:
    * a logical grouping of functions
    * a common context to store configuration variables that are available to all functions in the application

* In Oracle Functions, functions are:
    * small but powerful blocks of code that generally do one simple thing
    * grouped into applications
    * stored as Docker images in a specified Docker registry
    * invoked in response to a CLI command or signed HTTP request

The example is located in `thunder->examples->dev-tools->functions`

### Description
* Parameters for Applications:
    * compartment_name - The compartment name in which the application will be created
    * subnet_name - The names for all the subnets in which to run functions in the application
    * display_name - The name of the application
    * config - The application configuration. These values are passed on to the function as environment variables, functions
    may override application configuration. Keys must be ASCII strings consisting solely of letters, digits, and the '_' (underscore)
    character, and must not begin with a digit. Values should be limited to printable unicode characters
    * freeform_tags - The freeform tags for the application  

* Parameters for Functions:
    * function_app - The Application name where this function belongs to
    * display_name - The display name of the function
    * image  - The qualified name of the Docker image to use in the function, including the image tag. The image should be in the
    Oracle Cloud Infrastructure Registry that is in the same region as the function itself. Example: phx.ocir.io/ten/functions/function:0.0.1
    * memory\_in\_mbs - The maximum usable memory for the function (MiB)
    * image_digest  - The image digest for the version of the image that will be pulled when invoking this function. If no
    value is specified, the digest currently associated with the image in the Oracle Cloud Infrastructure Registry will be used.
    * config - The function configuration. These values are passed on to the function as environment variables, this overrides application configuration values.
    Keys must be ASCII strings consisting solely of letters, digits, and the '_' (underscore)
    character, and must not begin with a digit. Values should be limited to printable unicode characters.
    * timeout\_in\_seconds - Timeout for executions of the function. Value in seconds.
    * freeform_tags - The freeform tags for the application


Apart from the **provider.auto.tfvars**, there may be some other dependencies in the **terraform.tfvars** file that you will have to address.
All the dependencies from this section should have resources that already exist in OCI.

For this module, you are going to have dependencies to some external resources:
- compartments

In order to address those, you will need to change the values of the variables accordingly in the **terraform.tfvars** file.


### Example
In the provided example, the following resources are created:

* 1 Application
  * thunder_app
* 1 Function
  * thunder_fn

The compartment\_ids will be external to the app params in order to offer multiple ways of linking them from a terraform perspective.
In the example from below, there is a list of compartments containing 2 elements. By setting the app\_params `compartment_name` to sandbox, The ad will be created in the first element of the list: `ocid1.compartment.oc1..`. All lists can be extended in order to satisfy your needs.


The example is based on terraform.tfvars values:

```
compartment_ids = {
  sandbox = "ocid1.compartment.oc1.."
}

app_params = {
  thunder_app = {
    compartment_name = "db_rampup"
    subnet_name      = ["hur1pub", "hur1prv"]
    display_name     = "thunder_app"
    config           = {
      "MY_FUNCTION_CONFIG" : "ConfVal"
    }
    freeform_tags    = {
      "client"     : "hurricane",
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
    config             = {
      "MY_FUNCTION_CONFIG" : "ConfVal"
    }
    freeform_tags      = {
      "client"     : "hurricane",
      "department" : "hurricane"
    }
  }
}
```
Don't forget to populate the provider with the details of your tenancy as specified in the main README.md file.

### Running the code

```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply --var-file=path_to_provider.auto.tfvars

# If you are done with this infrastructure, take it down
$ terraform destroy --var-file=path_to_provider.auto.tfvars
```


## Useful links
[Containers](https://docs.cloud.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengoverview.htm)

[API-Gateway](https://docs.cloud.oracle.com/en-us/iaas/Content/APIGateway/Concepts/apigatewayconcepts.htm)

[Functions](https://docs.cloud.oracle.com/en-us/iaas/Content/Functions/Concepts/functionsoverview.htm)
