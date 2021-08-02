# Grafana automation

## Introduction
This project will build Grafana environment using terraform automation.

## Objectives
- Deploy Grafana on OCI using Thunder

## Step 1 - Prerequisites
The code can be found in `thunder->examples->run->grafana`

You will need to:
  * Terraform v0.12.13 or greater <https://www.terraform.io/downloads.html/>
  * OCI Provider for Terraform v3.11 or greater <https://github.com/oracle/terraform-provider-oci/releases>
  * VCN already exists (Public Subnet, Route Table, Internet Gateway)

You will have to generate a terraform provider configuration as follows:

```
provider_oci = {
  tenancy       = "The id of the tenancy"
  user_id       = "The id of the user"
  key_file_path = "The path to the oci api private key created in the Deployment section"
  fingerprint   = "The fingerprint of the above key"
  region        = "The region in which you want to spawn grafana instance"
}
```

## Step 2 - Grafana Example

This module creates an instance, a dynamic group and an instance principal. It is also installing and configuring Grafana to use oci datasource. Grafana is using the OCI Metrics dashboard in order to be able to monitor the different component from OCI.

After you run the code, you will need to import the dashboard from */dashboards* folder manually.
To do this you need to:
* connect to the grafana instance by using the **grafana_connection_url** output
* use admin/admin as the credentials
* click on the + button located on the left bar and click import.
* copy and paste the content from */dashboards/oci_dashboard.json* and upload it
* Select *oci* datasource to be used for the dashboard.
* [If required] if the variables don't display any value you need to go to variables section from dashboard settings and turn on and off the include all option and save the changes. After doing this the variables will be refreshed and you will be able to select different compartments/regions.


The variables for this module are described bellow:

*instance_params*

  * ad (the availability domain of the instance)
  * shape (the shape of the instance)
  * hostname (the hostname of the instance)
  * assign\_public\_ip (set to true in order to have a public ip, false otherwise)
  * boot\_volume\_size (the boot volume size of the instance's boot volume)
  * source_type (should be set to image)
  * source_id (the image ocid)
  * preserve\_boot\_volume (set to 1 if you want to preserve the boot volume after the instance deletion, 0 otherwise)
  * subnet_id (a public subnet where instance will be created - the security lists needs to have port 3000 opened)
  * compartment_id (compartmend ocid where the instance will be created)

*ssh\_public\_key* - the public ssh key path used for connecting to the instance

*ssh\_private\_key* - the private ssh key path used for connecting to the instance

*home_region* - Home region for tenancy

*instance\_principal\_params*

* dg_description (The description of the dynamic group)
* dg_name (The name of the dynamic group)
* policy_description (The description of the policy)
* policy_name (The name of the policy)


## Step 3 - Running the code


Go to thunder->examples->run->grafana of the repository:

```
# Run init to get terraform modules
$ terraform init

# Run the plan command to see what will happen.
$ terraform plan --var-file=path_to_provider.auto.tfvars

# If the plan looks right, apply it.
$ terraform apply --var-file=path_to_provider.auto.tfvars

# If you are done with this infrastructure, take it down
$ terraform destroy
```

## Results
After completing this lab series you should be able to deploy Grafana on OCI using Thunder.

## Utils
[Grafana on OCI](https://grafana.com/blog/2019/02/25/oracle-cloud-infrastructure-as-a-data-source-for-grafana/)
