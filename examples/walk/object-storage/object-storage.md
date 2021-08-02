# Object Storage

## Introduction
Oracle Cloud Infrastructure offers two distinct storage class tiers to address the need for both performant, frequently accessed "hot" storage, and less frequently accessed "cold" storage. Storage tiers help you maximize performance where appropriate and minimize costs where possible.


## Objectives
- Get familiar with the example
- Understand Thunder Object Storage Module Components
- Create object storage buckets using Thunder Object Storage

## Step 1 - Example & Module Details
The example is located in `thunder->examples->walk->object-storage`

### Resources Details
The terraform modules uses the following variables:
* Bucket parameters
    * compartment_name - The compartment name in which the bucket will be created
    * name - The name of the bucket
    * access_type - The type of public access enabled on this bucket. If a bucket is set to NoPublicAccess it allows an authenticated caller to access the bucket and its contents. When ObjectRead is enabled on the bucket, public access is allowed for the GetObject, HeadObject, and ListObjects operations. When ObjectReadWithoutList is enabled on the bucket, public access is allowed for the GetObject and HeadObject operations.
    * storage_tier - The type of storage tier of this bucket. A bucket is set to 'Standard' tier by default, which means the bucket will be put in the standard storage tier. When 'Archive' tier type is set explicitly, the bucket is put in the Archive Storage tier. The 'storageTier' property is immutable after bucket is created.
    * events_enabled - A property that determines whether events will be generated for operations on objects in this bucket.
    * kms\_key\_name - The name of the KMS master key that will be used for encrypting the bucket. Empty string "" means that the KMS will not be used and the bucket will be encrypted using Oracle-managed keys

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
The definition of each resource can be inspected in the **terraform.tfvars** file in the `thunder->examples->walk->object-storage` directory.

Don't forget to populate the **provider.auto.tfvars** with the details of your tenancy as specified in the [Lab 3 - Prerequisites Step 5](../../../workshop/index.html?lab=lab-3-install-prepare-prerequisites).


In our example one standard bucket is created with no public access and no events enabled.

In the example from below, there is a list of compartments containing 1 element. By setting in bucket_params `compartment_name` to sandbox, The buckets will be created the sandbox compartment `ocid1.compartment.oc1..`.
All lists can be extended in order to satisfy your needs.

```
compartments    = {
  sandbox = "ocid1.compartment.oc1.."
}

bucket_params   = {
  hur-buck-1 = {
    compartment_name = "sandbox"
    name              = "hur-buck-1"
    access_type       = "NoPublicAccess"
    storage_tier      = "Standard"
    events_enabled    = false
    kms_key_name = ""
  }
}
```


## Step 4 - Running the code

Go to **thunder/examples/walk/object-storage**
```
# Run init to get terraform modules
$ terraform init

# Create the infrastructure
$ terraform apply --var-file=path_to_provider.auto.tfvars

# If you are done with this infrastructure, take it down
$ terraform destroy --var-file=path_to_provider.auto.tfvars
```

## Results
After finishing this lab, you've managed to create an object storage bucket with no public access and no events enablesd.


## Useful links
[Object Storage Overview](https://docs.cloud.oracle.com/iaas/Content/Object/Concepts/objectstorageoverview.htm)

[Terraform Object Storage Bucket](https://www.terraform.io/docs/providers/oci/r/objectstorage_bucket.html)
