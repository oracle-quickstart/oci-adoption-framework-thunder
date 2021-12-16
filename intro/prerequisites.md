# Prerequisites

## Introduction

Terraform and python are needed to run all of the components in this framework.
In addition to this, you will also need to generate an OCI API key, add it to your OCI user and prepare tenancy variables in the **provider.auto.tfvars** file.

## Objectives

#### The objective of this lab is to get familiar with the Thunder repository and have everything prepared for running the examples.
You will:
- Download the source code
- Understand the repository structure
- Install Terraform and add it to your system's PATH
- Install Python and OCI Python SDK
- Generate an OCI API Key
- Gather Tenancy related variables (tenancy\_id, user\_id, local path to the oci\_api\_key private key, fingerprint of the oci\_api\_key\_public key, and region)

## Step 1 - Downloading the source code
The source code is available at the following [url](https://github.com/oracle-quickstart/oci-adoption-framework-thunder).
You can easily go to that url and clone or download the project.


## Step 2 - Understanding the repository structure
Directory structure for Thunder, is shown below:

![Thunder Structure](../images/thunder-structure.png)

There are multiple folders in the repository, but the most important ones are:
- **modules** - The logic of the terraform code
- **examples** - All of the examples inside of the repository; This will be the folder used for running the code.
- **userdata** - CloudInit scripts used by the **modules**

In the **modules** folder, there are different terraform modules used by all of the automations. Every module has the following structure:
- **main.tf** -> Module logic (which components are going to be created and how are they going to be linked)
- **variables.tf** -> Module variables (The parameters of the module)
- **outputs.tf** -> Module outputs (Outputs can be used to print different resource values for a resource type, or to create links between other modules at instantiation)

In the **examples** folder, there are different instantions based on the modules described above and other examples based on python. There are also some examples based on Packer / GlusterFS / Grafana or Sample CI/CDs but we will discuss about them in the following labs.
Every terraform based example will have the following structure:
- **main.tf** -> Example logic (which modules are going to be instantiated and how are they going to be linked)
- **variables.tf** -> Example variables (the variables used to instantiate the modules)
- **terraform.tfvars** -> Values for all the variables (this file will define how your infrastructure will look like. You can add / delete / modify values for all of the variables and based on those changes you will be able to achieve your desired infrastructure)
- **outputs.tf** -> Example outputs (prints different values of resources to the console.)

Take a moment to go through the folders and understand what examples are available. They are also described in the Introduction and Overview Lab.

## Step 3 - Installing Terraform

Go to [terraform.io](https://www.terraform.io/downloads.html) and download the proper package for your operating system and architecture. Terraform is distributed as a single binary.
Install Terraform by unzipping it and moving it to a directory included in your system's PATH. You will need the latest version available.

## Step 4 - Installing Python and OCI Python SDK

Go to [python.org](https://www.python.org/downloads/release/python-370/) and download the proper package for your operating system and architecture. Install python by following the setup instructions.

The easiest way to install oci python sdk is by using pip. This can be done after you've install python, by doing the following:
`$ pip install oci`

You can check other ways to install the oci python sdk [here](https://oracle-cloud-infrastructure-python-sdk.readthedocs.io/en/latest/installation.html)

You will also have to create a config file for oci, but we will cover this in Step 5.

## Step 5 - Prepare Terraform Provider Values and OCI config file

**Provider.auto.tfvars** is located in the root directory of thunder. Make sure you already have the Thunder repository downloaded.

This file is used in order to be able to make API calls in OCI, hence it will be needed by all terraform automations.
This file can be used by all the terraform automations in Thunder, by specifying it with **--var-file** flag when are you are *planning / applying / destroying* the infrastructure. If you don't want to use the **--var-file** flag when running the code, you can add it to the root directory of the example that you want to run.

In order to prepare **provider.auto.tfvars** file, you will need the following:
- Tenancy OCID
- User OCID
- Local Path to your private oci api key
- Fingerprint of your public oci api key
- Region


#### Getting the Tenancy and User OCIDs

You will have to login to the [console](https://console.us-ashburn-1.oraclecloud.com) using your credentials (tenancy name, user name and password). If you do not know those, you will have to contact a tenancy administrator.

In order to obtain the tenancy ocid, after logging in, from the menu, select Administration -> Tenancy Details. The tenancy OCID, will be found under Tenancy information and it will be similar to **ocid1.tenancy.oc1..aaa…**

In order to get the user ocid, after logging in, from the menu, select Identity -> Users. Find your user and click on it (you will need to have this page open for uploading the oci\_api\_public\_key). From this page, you can get the user OCID which will be similar to **ocid1.user.oc1..aaaa…**


#### Creating the OCI API Key Pair and Upload it to your user page

Create an oci\_api\_key pair in order to authenticate to oci as specified in the [documentation](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#How):

Create the .oci directory in the home of the current user

`$ mkdir ~/.oci`

Generate the oci api private key

`$ openssl genrsa -out ~/.oci/oci_api_key.pem 2048`

Make sure only the current user can access this key

`$ chmod go-rwx ~/.oci/oci_api_key.pem`

Generate the oci api public key from the private key

`$ openssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem`

You will have to upload the public key to the oci console for your user (go to your user page -> API Keys -> Add Public Key and paste the contents in there) in order to be able to do make API calls.

After uploading the public key, you can see its fingerprint into the console. You will need that fingerprint for your provider.auto.tfvars file.
You can also get the fingerprint from running the following command on your local workstation by using your newly generated oci api private key.

`$ openssl rsa -pubout -outform DER -in ~/.oci/oci_api_key.pem | openssl md5 -c`


#### Getting the Region

Even though, you may know your region name, you will needs its identifier for the provider.auto.tfvars file (for example, US East Ashburn has us-ashburn-1 as its identifier).

In order to obtain your region identifier, you will need to Navigate in the OCI Console to Administration -> Region Management

Select the region you are interested in, and save the region identifier.


#### Prepare the provider.auto.tfvars file

You will have to modify the **provider.auto.tfvars** file (root directory of the Thunder repository) to reflect the values that you’ve captured.
The **provider_oci** map will have the following keys:
- **tenancy** (add your tenancy_id as the value)
- **user\_id** (add your user\_id as the value)
- **fingerprint** (add the fingerprint of the public **oci\_api\_key\_public.pem** you've generated and uploaded in the console to your user)
- **key\_file\_path** (add the local path to your private **oci\_api\_key.pem** key)
- **region** (add the region identifier)

In the end, your **provider.auto.tfvars** should look like this:
```
provider_oci = {
  tenancy       = "ocid1.tenancy.oc1.."
  user_id       = "ocid1.user.oc1.."
  fingerprint   = "45:87:.."
  key_file_path = "/root/.oci/oci_api_key.pem"
  region        = "us-ashburn-1"
}
```

#### Prepare oci python config file
You will first have to create the oci config file:
`$ touch ~/.oci/config`

After this, modify the contest to reflect the values you have captured (similar to building the **provider.auto.tfvars** file).
The config file should have the following content:

```
[DEFAULT]
user=ocid1.user.oc1..
fingerprint=45:87:..
key_file=/root/.oci/oci_api_key.pem
tenancy=ocid1.tenancy.oc1..
region=us-ashburn-1
```

Make sure that after the equal sign you don't have any quotes.


## Results

After going through this lab series, you should now be able to run the majority of the examples described inside of the repository.
You have now:
- intalled terraform, python and oci python sdk
- generated an oci api key and done the upload to your user page inside of your tenancy
- prepared the provider.auto.tfvars and oci config files
