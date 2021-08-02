# AutoScaling Group Examples

## Introduction

Autoscaling enables you to automatically adjust the number of Compute instances in an instance pool based on performance metrics such as CPU utilization. This helps you provide consistent performance for your end users during periods of high demand, and helps you reduce your costs during periods of low demand.


## Objectives
- Get familiar with the example
- Understand ASG Module structure
- Create ASGs using Thunder autoscaling

## Step 1 - Example & Module Details

The example is located in `thunder->examples->run->asg`.

The ASG module is able to create instance configurations, instance pools and autoscaling group configurations.

* Auto Scaling Group parameters
    * compartment_name - The compartment name in which the asg components will be created
    * name - The name of the asg components
    * freeform_tags - The freeform tags for the asg
    * shape - The shape of the asg
    * assign\_public\_ip - Whether or not to assign a public ip to the asg instances (to assing a public ip, the asg instances should be in a public subnet)
    * ssh\_public\_key - The path to ssh public key
    * hostname - The hostname used for the asg
    * size - The size of the boot volume in GBs
    * state - The state of the asg (can be RUNNING or STOPPED)
    * p_config - The placement configuration (can be repeated multiple times. In order to spread the instances between 2 ads, you should have at least 2 rules for 2 different ads.)
      * ad - The ad in which auto scaling should spawn instances
      * subnet - The subnet name in which auto scaling should spawn instances
    * lb\_config - If you want to place the instances from asg behind a load balancer (if you don't the lb\_config should be an empty list -> [])
      * backend\_set\_name - The name of the backend set in which you want to place the asg instances
      * lb_name - The name of the load balancer that should contain the instances
      * lb_port - The port on which the traffic will be balanced
    * policy_name - The name of the asg policy
    * initial_capacity - The initial capacity of asg instances (1, 2, 3..., etc)
    * max_capacity - The maximum number of asg instances
    * min_capacity - The minimum number of asg instances
    * policy_type - The type of policy that should be used by autoscaling configuration
    * rules - The list of rules for the autoscaling configuration
      * rule_name - The name of the rule
      * action_type - The action Type
      * action_value - The action value (Negative number for scale down. Positive number for Scale up)
      * metrics - The list of metrics for the rules
        * metric_type - The type of metric to be used
        * metric_operator - Metric operator (GT, GTE, LT, LTE)
        * threshold_value - The threshold value
    * cool\_down\_in\_seconds - cool down in seconds
    * is\_autoscaling\_enabled - Whether or not autoscaling is enabled

## Step 2 - Prepare the dependencies
Apart from the **provider.auto.tfvars**, there may be some other dependencies in the **terraform.tfvars** file that you will have to address.
All the dependencies from this section should have resources that already exist in OCI.

For this module, you are going to have dependencies to some external resources:
- compartments
- subnets
- load balancers
- backend sets
- images


In order to address those, you will need to change the values of the variables accordingly in the **terraform.tfvars** file.

Below, you will see the dependencies and what variables need to be changed.

### Compartment Dependency
In order to be able to run the sample code, you will have to prepare a map variable (like in the **terraform.tfvars** file) called **compartment\_ids**, which will hold key/value pairs with the names and ids of the compartments that you want to use.
This variable will be external in order to offer multiple ways of linking them from a terraform perspective.

```
compartment_ids = {
  sandbox = "ocid1.compartment.oc1.."
}
```

### Subnet Dependency
In order to be able to run the sample code, you will have to prepare a map variable (like in the **terraform.tfvars** file) called **subnet\_ids**, which will hold key/value pairs with the names and ids of the subnets that you want to use.
This variable will be external in order to offer multiple ways of linking them from a terraform perspective.

```
subnet_ids = {
  hur1pub  = "ocid1.subnet.oc1.."
  hur1priv = "ocid1.subnet.oc1.."
}
```

### Load balancer Dependency
In order to be able to run the sample code, you will have to prepare a map variable (like in the **terraform.tfvars** file) called **load\_balancer\_ids**, which will hold key/value pairs with the names and ids of the load balancers that you want to use.
This variable will be external in order to offer multiple ways of linking them from a terraform perspective.
By default, this variable will have no load balancer attached, but if you want to add the asg behind the load balancer you will have to add name/id pairs for this.
```
load_balancer_ids = {}
```

### Backend Set Dependency
In order to be able to run the sample code, you will have to prepare a map variable (like in the **terraform.tfvars** file) called **backend\_set\_ids**, which will hold key/value pairs with the names and ids of the backend sets that you want to use.
This variable will be external in order to offer multiple ways of linking them from a terraform perspective.
By default, this variable will have no backend sets attached, but if you want to add the asg behind the load balancer you will have to add name/id pairs for this.
```
backend_set_ids = {}
```

## Step 3 - What are you going to get
The definition of each resource can be inspected in the **terraform.tfvars** file in the `thunder->examples->run->asg` directory.

Don't forget to populate the **provider.auto.tfvars** with the details of your tenancy as specified in the [Lab 3 - Prerequisites Step 5](../../../workshop/index.html?lab=lab-3-install-prepare-prerequisites).

In the provided example, the following resources are created:
* 1 Autoscaling Group

.
In the example from below, there is a list of compartments containing 1 elements and a list of subnets containing 2 elements. By setting in compute\_params `compartment_name` to sandbox, the instances will be created in the sandbox compartment `ocid1.compartment.oc1..`. The same thing is happening to subnet\_ids, backend\_sets and load\_balance\r_ids. All lists can be extended in order to satisfy your needs.


The example is based on **terraform.tfvars** values:

```
compartment_ids = {
  sandbox = "ocid1.compartment.oc1.."
}
subnet_ids      = {
  hur1pub  = "ocid1.subnet.oc1"
  hur1priv = "ocid1.subnet.oc1"
}

images = {
  ap-mumbai-1    = "ocid1.image.oc1."
  ap-seoul-1     = "ocid1.image.oc1."
  ---------------------------------------------------------------
  us-ashburn-1   = "ocid1.image.oc1.."
  us-phoenix-1   = "ocid1.image.oc1.."
}

backend_sets      = {}
load_balancer_ids = {}

asg_params = {
  asg1 = {
    compartment_name = "sandbox"
    name             = "asg1"
    freeform_tags    = {}
    shape            = "VM.Standard2.1"
    assign_public_ip = "true"
    ssh_public_key   = "/root/.ssh/id_rsa.pub"
    hostname         = "asg1"
    size             = 2
    state            = "RUNNING" # Can be RUNNING or STOPPED
    p_config         = [
      {
        ad     = 1
        subnet = "hur1pub"
      },
      {
        ad     = 2
        subnet = "hur1pub"
      },
      {
        ad     = 3
        subnet = "hur1pub"
      }
    ]
    lb_config        = []
    initial_capacity = 2
    max_capacity     = 6
    min_capacity     = 2
    policy_name      = "asg_policy"
    policy_type      = "threshold"
    rules            = [
      {
        rule_name    = "scaleUp"
        action_type  = "CHANGE_COUNT_BY"
        action_value = 2
        metrics      = [
          {
            metric_type     = "CPU_UTILIZATION"
            metric_operator = "GT"
            threshold_value = 70
          }
        ]
      },
      {
        rule_name    = "scaleDown"
        action_type  = "CHANGE_COUNT_BY"
        action_value = -1
        metrics      = [
          {
            metric_type     = "CPU_UTILIZATION"
            metric_operator = "LT"
            threshold_value = 30
          }
        ]
      }
    ]
    cool_down_in_seconds   = 300
    is_autoscaling_enabled = true
  }
}

```

## Step 4 - Running the code

Go to **thunder/examples/run/asg**

```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply --var-file=path_to_provider.auto.tfvars

# If you are done with this infrastructure, take it down
$ terraform destroy --var-file=path_to_provider.auto.tfvars
```

## Results
At the end of this workshop, you should be able to create ASGs using Thunder.

## Useful Links
[Autoscaling Instance Pools](https://docs.cloud.oracle.com/en-us/iaas/Content/Compute/Tasks/autoscalinginstancepools.htm)

[Creating Instance Pools](https://docs.cloud.oracle.com/en-us/iaas/Content/Compute/Tasks/creatinginstancepool.htm)

[Creating Instance Configuration](https://docs.cloud.oracle.com/en-us/iaas/Content/Compute/Tasks/creatinginstanceconfig.htm)
