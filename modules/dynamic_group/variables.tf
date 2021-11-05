variable "dynamic_groups" {
  type = map(object({
    name                      = string
    description               = string
    resource_type             = string
    matching_compartment_name = string
  }))
}

variable "auth_provider" {
  type = map(string)
}

variable "matching_compartments" {
  type = map(any)
}


variable "dg_policy_params" {
  type = map(object({
    name             = string
    compartment_name = string
    description      = string
    statements       = list(string)
  }))
}
