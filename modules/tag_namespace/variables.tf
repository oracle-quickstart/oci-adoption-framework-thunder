variable "tag_namespace_params" {
  type = map(object({
    compartment_name = string
    description      = string
    name             = string
  }))
}

variable "tag_key_params" {
  type = map(object({
    description       = string
    name              = string
    tagnamespace_name = string
    is_cost_tracking  = bool
    validator_type    = string
    values            = list(string)
  }))
}

variable "compartments" {
  type = map(string)
}
