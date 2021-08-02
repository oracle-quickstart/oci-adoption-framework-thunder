# Always Free Resources

## Introduction
In this lab, you will deploy multiple resources that are always free in OCI.

## Objectives
- Get familiar with the example
- Create the always free resources using Thunder Free Tier

## Step 1 - Example Details and what are you going to get
The example can be found in `thunder->examples->free-tier`.

The definition of each resource can be inspected in the **terraform.tfvars** file in the `thunder->examples->free-tier` directory.

Don't forget to populate the **provider.auto.tfvars** with the details of your tenancy as specified in the [Lab 3 - Prerequisites Step 5](../../../workshop/index.html?lab=lab-3-install-prepare-prerequisites).

In this example, only always free resources are created:
* 1 Compute Instance (having a Micro shape)
* 1 Autonomous Transaction Processing DB
* 1 Standard Bucket (you can get 20GB of objects in it)
* 1 Compartment
* 1 User
* 1 Group
* 1 Policy
* 1 VCN with 1 subnet
* 1 Load balancer having one backend set, one listener and one backend

There are no external dependencies to other resources.

## Step 2 - Running the code
In order to be able to spin up the always free resources, you will have to navigate to **thunder -> examples -> free_tier**.

From the free tier folder you can run the following commands:
```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply --var-file=path_to_provider.auto.tfvars_file

# If you are done with this infrastructure, take it down
$ terraform destroy --var-file=path_to_provider.auto.tfvars_file
```

## Results
Without modifying anything and by running just `terraform apply`, you should be able to create the always free resources.

## Useful links
https://docs.cloud.oracle.com/iaas/Content/FreeTier/resourceref.htm
