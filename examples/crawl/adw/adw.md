# ADW Examples

## Introduction

Oracle Cloud Infrastructure's Autonomous Database is a fully managed, preconfigured database environment with two workload types available, Autonomous Transaction Processing and Autonomous Data Warehouse. You do not need to configure or manage any hardware, or install any software. After provisioning, you can scale the number of CPU cores or the storage capacity of the database at any time without impacting availability or performance.

## Objectives

## Description
- Get familiar with the example
- Understand Thunder ADW Module Components
- Create ADW / ATP dbs using Thunder ADW module

## Step 1 - Example & Module details
The example is located in `thunder->examples->crawl->adw`.

The ADW module is able to create ADW/ATP databases.

* Parameters
    * compartment_name - The compartment name in which the ADW/ATP will be created
    * cpu\_core\_count - The number of CPUs for the ADW/ATP
    * size\_in\_tbs - The ADW/ATP database size in terrabytes
    * db_name - The name of the databases
    * db_workload - The workload of the database (Supported values are "DW" for ADW and "OLTP" for ATP)
    * enable\_auto\_scaling - Whether you want to have auto scaling enables
    * is\_free\_tier - Whether you want your ADW to be included in the always free

## Step 2 - Prepare the dependencies
Apart from the **provider.auto.tfvars**, there may be some other dependencies in the **terraform.tfvars** file that you will have to address.
All the dependencies from this section should have resources that already exist in OCI.

For this module, you are going to have dependencies to some external resources:
- compartments

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

## Step 3 - What are you going to get
The definition of each resource can be inspected in the **terraform.tfvars** file in the `thunder->examples->crawl->iam` directory.

Don't forget to populate the **provider.auto.tfvars** with the details of your tenancy as specified in the [Lab 3 - Prerequisites Step 5](../../../workshop/index.html?lab=lab-3-install-prepare-prerequisites).

In the provided example, the following resources are created based on the db_workload type (DW will create an ADW, OLTP will create an ATP)

* 1 ADW
    * hurriadw
* 1 ATP
    * hurriatp


In the example from below, there is a list of compartments containing 2 elements. By setting in adw\_params `compartment_name` to sandbox, The ad will be created in the first element of the list: `ocid1.compartment.oc1..`. All lists can be extended in order to satisfy your needs.


The example is based on **terraform.tfvars** values:

```
compartment_ids = {
  sandbox = "ocid1.compartment.oc1.."
}

adw_params = {
  hurriatp = {
    compartment_name    = "sandbox"
    cpu_core_count      = 1
    size_in_tbs         = 1
    db_name             = "hurriatp"
    db_workload         = "OLTP"
    enable_auto_scaling = false
    is_free_tier        = false
  }
  hurriadw = {
    compartment_name    = "sandbox"
    cpu_core_count      = 1
    size_in_tbs         = 1
    db_name             = "hurriadw"
    db_workload         = "DW"
    enable_auto_scaling = false
    is_free_tier        = false
  }
}
```


## Step 4 - Running the code

Go to **thunder/examples/crawl/adw**

```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply --var-file=path_to_provider.auto.tfvars

# If you are done with this infrastructure, take it down
$ terraform destroy --var-file=path_to_provider.auto.tfvars
```

## Step 5 (Optional) - Experiment with the code
As you've already seen in the other examples from crawl, you can easily scale up the number of resource that you create.
Just add another map in `adw_params` inside of the `terraform.tfvars` file and you will increase the numbers of ADW/ATP by one. You can increase to any number of ADW/ATPs.


## Results
By running a simple `terraform apply` command, you were able to create one ATP database and one ADW database.

## Useful Links
[Autonomous Overview](https://docs.cloud.oracle.com/iaas/Content/Database/Concepts/adboverview.htm)

[Autonomous Terraform Resource](https://www.terraform.io/docs/providers/oci/r/database_autonomous_database.html)
