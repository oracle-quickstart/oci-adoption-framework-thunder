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
