compartments = {
  tenancy = "ocid1...."
}

tag_namespace_params = {
  "Environment-Tags" = {
    compartment_name = "tenancy"
    description      = "Environment Tag Namespace"
    name             = "Environment-Tags"
  }
}

tag_key_params = {
  "Ex1" = {
    description       = "Ex 1 Environment Tags"
    is_cost_tracking  = true
    name              = "Ex1"
    tagnamespace_name = "Environment-Tags"
    validator_type    = "Enum"
    values            = ["dev", "test", "prod", "staging"]
  }
  "Ex2" = {
    description       = "Ex 2 Environment Tags"
    is_cost_tracking  = true
    name              = "Ex2"
    tagnamespace_name = "Environment-Tags"
    validator_type    = "Enum"
    values            = ["dev", "test", "prod", "staging"]
  }
}
