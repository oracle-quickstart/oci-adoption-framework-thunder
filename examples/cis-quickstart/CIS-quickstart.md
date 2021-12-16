# CIS Quickstart

## Introduction
The CIS-quickstart template will deploy  a standardized environment in an OCI tenancy that will help organizations to comply with the [CIS OCI Foundations Benchmark v1.1](https://www.cisecurity.org/benchmark/oracle_cloud/).

The resources within this project are related to:

- IAM (Identity & Access Management)
- Bastion
- Networking
- Keys
- Cloud Guard
- Logging
- Vulnerability Scanning
- Events
- Notifications
- Object Storage


## Overview
This template will create four compartments under an enclosing compartment with groups, dynamic groups and IAM policies to segregate access to resources based on job functions. This design reflects a basic functional structure where IT responsibilities are split among networking, security, application development and database admin teams.
The network architecture will deploy a standard three-tier architecture. A VCN with 3 subnets, a public subnet for load balancers and bastion, and two private subnets for application and database tiers with already configured security lists, route tables, network security groups, internet gateways, nat gateways and service gateways.


The followint resources will be deployed:
* Compartments 
    * Enclosing compartment
    * Network compartment
    * Security compartment
    * Application development compartment
    * Database compartment


* Groups
    * A group for resource provisioning
    * A group for managing security services in the security compartment
    * A group for managing networking in the network compartment
    * A group for managing databases in the database compartment 
    * A group for managing app development related services in the application compartment 
    * A group for managing IAM resources in the tenancy
    * A group for managing users credentials in the tenancy
    * A group for auditing the tenancy
    * A group for reading Console announcements   
 

* Policies
    * IAM Policies with statements to segregate access to resources based on job functions


* Dynamic groups
    * A dynamic group for functions in the enclosing compartment
    * A dynamic group for Autonomous Databases in the enclosing compartment
    * A dynamic group for functions in  the security compartment
    * A dynamic group for functions in the application compartment 
    * A dynamic group for databases in the database compartment 


* Vault
    * One Vault in the security compartment


* Encryption key
    * One Encryption key to be used by the Object Storage Bucket 


* Object Storage Bucket
    * One Object storage Bucket in the application compartment


* Bastion Service
    * One Bastion in the public subnet of the VCN

* Logging
    * A logging group for the flow logs in the security compartment
    * A logging group for the object storage logs in the security compartment 
    * A log for the public subnet
    * A log for the database subnet
    * A log for the application subnet
    * A log for the object storage bucket  


* Notifications
    * A topic for security related notifications
    * A topic for network related notifications
    * Subscriptions


* Network
    * One VCN
    * One internet gateway
    * One nat gateway
    * One service gateway
    * Three route tables with route rules
    * Three security lists with ingress rules
    * Three subnets ( One public and two private for application and database tiers)
    * Four network security groups with network security group rules


* Cloud Guard
    * A cloud guard configuration if a configuration doesn't already exist
    * A cloud guard target for the security compartment


* Vulnerability scan
    * A host scan recipe
    * A host scan target for security compartment
    * A host scan target for network compartment
    * A host scan target for application compartment
    * A host scan target for database compartment
   
## Prerequisites

 * Terraform v1.0.11 or greater <https://www.terraform.io/downloads.html>
 * OCI Provider for Terraform v3.58.0 or greater <https://github.com/oracle/terraform-provider-oci/releases>

### Authentication to OCI
Set up a config file with the required credentials on your Workstation or Instance described in Dependencies. See [SDK and Tool Configuration](https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/sdkconfig.htm) for instructions.

Terraform will need an oci provider which can be defined in the provider.auto.tfvars file in every component and the values must reflect your OCI tenancy:
```
provider_oci = {
  tenancy       = ""
  user_id       = ""
  fingerprint   = ""
  key_file_path = ""
  region        = ""
}
```


## Architecture

### IAM
The IAM module is able to create compartments, groups, users and policies. In addition to this, it is also able to add users to groups.

#### Resources Details
* Groups parameters
    * name - Name of the group
    * description - Description of the group

* User parameters
    * name - Name of the user
    * description - Description of the user
    * group_name - Specify the name of the group in which the user should be automatically added at provisioning

* Compartment parameters
    * name - Name of the compartment
    * description - Description of the compartment
    * enable_delete - Whether you want to delete or not the compartment on terraform destroy

* Policies parameters
    * name - Name of the policy
    * description - Description of the policy
    * compartment_name - The compartment for the policy (if none is provided, the policy will be created under tenancy)
    * statements - A list of statements for the policies that will grant different levels of access


### Dynamic group
The Dynamic group module is able to create dynamic groups and policies

#### Resource Details
* Dynamic Groups parameters
    * name - Name of the dynamic group
    * description - Description of the dynamic group
    * resource_type - Dynamic group resource type
    * matching_compartment_name - The matching compartment for the dynamic group

* Dynamic group policies parameters
    * name - Name of the policy
    * description - Description of the policy
    * compartment_name - The compartment for the policy
    * statements - A list of statements for the policies that will grant different levels of access


### Network
The Network module is able to create VCNs, internet gateways, nat gateways, service gateways, route tables, security lists, network security groups, subnets, dynamic routing gateways, local peering gateways.

#### Resources Details
* VCN parameters
    * compartment_name - The name of the compartment in which the VCN will be created
    * display_name - The name of the vcn
    * vcn_cidr - The cidr block of the vcn
    * dns_label - The dns label of the vcn

* Internet Gateway parameters
    * display_name - The display name of the Intenet gateway
    * vcn_name - The name of the vcn used for the internet gateway association

* Nat Gateway parameters
    * display_name - The display name of the NAT gateway
    * vcn_name - The name of the vcn used for the NAT gateway association

* Route Table parameters
    * display_name - The display name of the Route Table
    * vcn_name - The name of the vcn used for the Route Table association
    * route_rules parameters
        * destination - Cidr block destination
        * use_igw - Whether you want to use an Internet Gateway in the route rule
        * igw_name - The name of the internet gateway used for the Route Table association
        * ngw_name - The name of the nat gateway used for the Route Table assocation

* Security Lists parameters
    * display_name - The display name of the Security Lists
    * vcn_name - The name of the vcn used for the Security Lists association
    * egress_rules parameters
      * stateless - Whether the rule is staless or not
      * protocol - Can be set to 1 (ICMP), 6 (TCP), 17 (UDP) or ALL
      * destination - cidr block destination
    * ingress_rules parameters
      * stateless - Whether the rule is staless or not
      * protocol - Can be set to 1 (ICMP), 6 (TCP), 17 (UDP) or ALL
      * source\_type - Can be CIDR\_BLOCK or SERVICE\_CIDR_BLOCK
      * source - cidr block source
      * tcp_options parameters (can be an empty list and no tcp rules will be created)
        * min - port value
        * max - port value
      * udp_options parameters (can be an empty list and no udp rules will be created)
        * min - port value
        * max - port value

* Network Security Group parameters
    * display_name - The display name of the NSG
    * vcn_name - The name of the vcn used for the NSG association

* Network Security Groups Rules parameters
    * nsg_name - The name of the NSG used for the NSG rule association
    * protocol - Can be set to 1 (ICMP), 6 (TCP), 17 (UDP) or ALL
    * stateless - Whether the rule is staless or not
    * direction - Can be INGRESS (will force source and source type rules) or EGRESS (will force destination and destination type rules)
    * destination - cidr block destination (null if the direction is set to INGRESS)
    * destination\_type - Can be CIDR\_BLOCK (null if the direction is set to INGRESS)
    * source - cidr block source (null if the direction is set to EGRESS)
    * source\_type - Can be CIDR\_BLOCK (null if the direction is set to EGRESS)
    * tcp_options parameters (can be an empty list and no tcp rules will be created)
      * destination\_ports parameters (can be an empty list if you want to use source\_ports)
        * min - port value
        * max - port value
      * source\_ports parameters (can be an empty list if you want to use destination\_ports)
        * min - port value
        * max - port value
    * udp_options parameters (can be an empty list and no udp rules will be created)
      * destination\_ports parameters (can be an empty list if you want to use source\_ports)
        * min - port value
        * max - port value
      * source\_ports parameters (can be an empty list if you want to use destination\_ports)
        * min - port value
        * max - port value

* Subnet parameters
    * display_name - The name of the subnet
    * vcn_cidr - The cidr block of the subnet
    * dns_label - The dns label of the subnet
    * is\_subnet\_private - Whether the subnet is private or not
    * sl_name - The name of the security list used for the Subnet association
    * rt_name - The name of the route table used for the Subnet association
    * vcn_name - The name of the vcn used for the Subnet association

* Local peering gateway (LPG) parameters
    * requestor - The name of the requestor VCN
    * acceptor - The name of the acceptor VCN
    * display_name - The name of the LPG connection

* Dynamic Routing Gateway (DRG) parameters
    * name - The name of the DRG
    * vcn_name - The name of the vcn used by the DRG for the Compartment association

* Dynamic Routing Gateway (DRG) attachment parameters
    * drg_name - The name of the DRG
    * vcn_name - the name of the vcn that will be attached to the DRG    
    * cidr_rt - The list of cidrs for the route tabes in **rt_names** that will be routed through the DRG 
    * rt_names - The names of the Route tables used for the DRG association


### Notifications
The Notifications module is able to create topics and subscriptions

#### Resources Details
* Topic parameters
    * comp_name - The name of the compartment in which the topic will be created
    * topic_name - The name of the topic
    * description - The description of the topic

* Subscription parameters
    * comp_name - The name of the compartment in which the topic will be created
    * endpoint - The endpoint of the subscription
    * protocol - The protocol of the subscription
    * topic_name - The name of the topic


### Bastion service
The Bastion module is able to create bastions

#### Resource Details
* Bastion parameters
    * bastion_name - The name of the Bastion
    * bastion_type - The type of Bastion
    * comp_name - The name of the compartment in which the bastion will be created
    * subnet_name - The name of the subnet that the bastion connects to 
    * cidr_block_allow_list - A list of address ranges in CIDR notation that you want to allow to connect to sessions hosted by this bastion
    * max_session_ttl_in_seconds - The maximum amount of time that any session on the bastion can remain active    


### Object storage
The Object storage module is able to create object storage buckets

#### Resources Details
* Bucket parameters
    * compartment_name - The compartment name in which the bucket will be created
    * name - The name of the bucket
    * access_type - The type of public access enabled on this bucket. If a bucket is set to NoPublicAccess it allows an authenticated caller to access the bucket and its contents. When ObjectRead is enabled on the bucket, public access is allowed for the GetObject, HeadObject, and ListObjects operations. When ObjectReadWithoutList is enabled on the bucket, public access is allowed for the GetObject and HeadObject operations.
    * storage_tier - The type of storage tier of this bucket. A bucket is set to 'Standard' tier by default, which means the bucket will be put in the standard storage tier. When 'Archive' tier type is set explicitly, the bucket is put in the Archive Storage tier. The 'storageTier' property is immutable after bucket is created.
    * events_enabled - A property that determines whether events will be generated for operations on objects in this bucket.
    * kms\_key\_name - The name of the KMS master key that will be used for encrypting the bucket. Empty string "" means that the KMS will not be used and the bucket will be encrypted using Oracle-managed keys


### KMS
The KMS module is able to create vaults and encryption keys.

#### Resources Details
* Vault parameters
    * compartment_name - The compartment name in which the vault will be created
    * display_name - The name of the vault
    * vault\_type - The vault type. Currently, 2 types are available: VIRTUAL (the DEFAULT value) and VIRTUAL\_PRIVATE

* Key parameters
    * compartment_name - The compartment name in which the key will be created
    * display_name - The name of the key
    * vault_name -  The vault name in which the key will be created
    * key\_shape\_algorithm - the encryption algorithm for which we can use the key. Currently, only AES can be used
    * key\_shape\_size\_in\_bytes - the size of the key exprimated in bytes. Currently, 3 values can be used:
    16 (for 128 bits), 24 (for 192 bits), 32 (for 256 bits)
    * rotation_version - whenever this number is increased, the key will be rotated. First value should be 0 in normal situations


### Logs
The Logging module is able to create log groups and logs.

#### Resources Details
* Log group parameters
    * comp_name - The compartment name in which the log group will be created
    * log_group_name - The name of the log group

* Log parameters
    * log_name - The name of the log
    * log_group - The name of the log group  
    * log_type - The type of the log
    * source_log_category - The log object category  
    * source_resource - The name of the resource emmiting the log
    * source_service - The service generating log
    * source_type - The log source type
    * comp_name - The compartment name in which the log will be created
    * is_enabled - Whether or not the log is enabled
    * retention_duration -  The Log retention duration in 30-day increments (30, 60, 90 and so on)


### Vulnerability Scan
The Vulnerability Scan module is able to create host scan recipes and targets.

#### Resources Details
* Host scan recipe parameters
    * display_name - The name of the host scan recipe
    * comp_name - The name of the compartment in which the host scan recipe will be created
    * scan_level - The scan level of the agent
    * agent_config_vendor - The vendor to use for the host scan agent
    * cis_bench_scan_level - The level of strictness to apply for CIS Benchmarks
    * port_scan_level - The scan level of the port
    * schedule_type - How often the scan occurs
    * day_of_week - The day of week the scheduled scan occurs 

* Host scan target parameters
    * display_name - The name of the target
    * comp_name - The compartment name in which the host scan target will be created
    * recipe_name - The name of the host scan recipe
    * target_comp_name - The name of the targetted compartment


### Events
The Events module is able to create events.

#### Resources Details
* Event parameters
    * rule_display_name - The name of the event
    * rule_is_enabled - Whether or not the event is enabled
    * compartment_name - The name of the compartment in which the event will be created
    * action_type - The action to perform if the condition in the rule matches an event ( ONS for Notification topic, OSS for Stream service, FAAS for Function service)
    * actions_description - The description of the event
    * is_enabled - Whether or not the action is enabled
    * function_name - The name of the function if the action_type is FAAS
    * stream_name - The name of the stream of the action_type is OSS
    * topic_name - The name of the notification topic if the action_type is ONS
    * condition - The conditions that will trigger the event


### Cloud Guard
The Cloud Guard module is able to create cloud guard configuration and targets

#### Resources Details
* Cloud guard configuration parameters
    * comp_name - The compartment name in which the cloud guard configuration will list resources
    * status - The status of the Cloud Guard Tenant
    * self_manage_resources -  Whether or not the Oracle managed resources will be created by the customer
    * region_name - The reporting region name

* Cloud Guard target parameters
    * display_name - The name of the detector template
    * comp_name - The name of the compartment in which the cloud guard target will be created
    * target_name - The name of the target resource
    * target_type - The type of the target resource



## Running the code

### Run init to get terraform modules
$ terraform init

### Create the infrastructure
$ terraform apply

### If you are done with this infrastructure, take it down
$ terraform destroy


## Things to know

* Since the linking of resources are done by name, If you want to change parameters in the tfvars files, make sure to also change it in the resources that are linked to those parameters.
    * Example:
        * If you change the name of a compartment
        ```
        From:

        lz-network-cmp = {
          name          = "lz-network-cmp"
          description   = "Landing Zone compartment for all network related resources: VCNs, subnets, network gateways, security lists, NSGs, load balancers, VNICs, and others."
          enable_delete = false
          parent_name   = "lz-top-cmp"
        }

        To:

        network = {
          name          = "network"
          description   = "Landing Zone compartment for all network related resources: VCNs, subnets, network gateways, security lists, NSGs, load balancers, VNICs, and others."
          enable_delete = false
          parent_name   = "lz-top-cmp"
        }
        ```
        * You should also change it in the other tfvars files that are related to this compartment:
        ```
        From:

        lz-0-vcn = {
          compartment_name = "lz-network-cmp"
          display_name     = "lz-0-vcn" 
          vcn_cidr         = "10.0.0.0/20"
          dns_label        = "lz0vcn"
        }

        To:

        lz-0-vcn = {
          compartment_name = "network"
          display_name     = "lz-0-vcn" 
          vcn_cidr         = "10.0.0.0/20"
          dns_label        = "lz0vcn"
        }
        ```
* **Esiest way would be to use find and replace.**        


## Known issues
* OCI Compartment Deletion
    * By design, OCI compartments are not deleted upon Terraform destroy by default. Deletion can be enabled in Landing Zone by setting *enable_delete* variable to true in iam_comp.auto.tfvars file. However, compartments may take a long time to delete. Not deleting compartments is ok if you plan on reusing them. 

* OCI Vault Deletion
    * By design, OCI vaults and keys are not deleted immediately upon Terraform destroy, but scheduled for deletion. Both have a default 30 day grace period. For shortening that period, use OCI Console to first cancel the scheduled deletion and then set the earliest possible deletion date (7 days from current date) when deleting.
