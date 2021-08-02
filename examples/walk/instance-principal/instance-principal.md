# Instance Principal Examples

## Introduction
Below there is a simple example of how to create the required resources in order to make an instance principal.
This procedure describes how you can authorize an instance to make API calls in Oracle Cloud Infrastructure services. After you set up the required resources and policies, an application running on an instance can call Oracle Cloud Infrastructure public services, removing the need to configure user credentials or a configuration file.

## Objectives
- Get familiar with the example
- Understand Thunder Instance Principal Module Components
- Create entire instance principal using Thunder Instance Principal Module

## Step 1 - Example & Module Details
The example is located in `thunder->examples->walk->object-storage`


### Resources Details
* Instance principal parameters
    * dg_description - The description of the dynamic group
    * dg_name - The name of the dynamic group
    * policy_description - The description of the policy
    * policy_name - The name of the policy
    * instance_name - The name of the instance

## Step 2 - Prepare the dependencies
Apart from the **provider.auto.tfvars**, there may be some other dependencies in the **terraform.tfvars** file that you will have to address.
All the dependencies from this section should have resources that already exist in OCI.

For this module, you are going to have dependencies to some external resources:
- instances

In order to address those, you will need to change the values of the variables accordingly in the **terraform.tfvars** file.

Below, you will see the dependencies and what variables need to be changed.

### Instance Dependency
In order to be able to run the sample code, you will have to prepare a map variable (like in the **terraform.tfvars** file) called **instance\_ids**, which will hold key/value pairs with the names and ids of the instances that you want to use.
This variable will be external in order to offer multiple ways of linking them from a terraform perspective.

```
instances = {
  hur1 = "ocid1.instance.oc1.."
}
```

## Step 3 - What are you going to get
The definition of each resource can be inspected in the **terraform.tfvars** file in the `thunder->examples->walk->instance-principal` directory.

Don't forget to populate the **provider.auto.tfvars** with the details of your tenancy as specified in the [Lab 3 - Prerequisites Step 5](../../../workshop/index.html?lab=lab-3-install-prepare-prerequisites).


In the example, the following components are created:
  * one dynamic group
  * one policy

A list of instances is given in this example and based on those instances, a dynamic group and a policy for it are created. The dynamic group will make the instance principal and the policy will give it permissions all over the tenancy.


```
instances = {
  hur1 = "ocid1.instance.oc1.."
}

instance_principal_params = {
  web = {
    dg_description     = "instance principal web"
    dg_name            = "web"
    policy_description = "web"
    policy_name        = "web"
    instance_name      = "hur1"
  }
}
```

## Step 4 - Running the code

Go to **thunder/examples/walk/instance-principal**
```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply --var-file=path_to_provider.auto.tfvars

# If you are done with this infrastructure, take it down
$ terraform destroy --var-file=path_to_provider.auto.tfvars
```

## Results

By running the code, an instance should have the instance principal role.


## Useful links
[Instance Principal Overview](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/callingservicesfrominstances.htm)

[Terraform Instance Principal](https://www.terraform.io/docs/providers/oci/r/identity_dynamic_group.html)
