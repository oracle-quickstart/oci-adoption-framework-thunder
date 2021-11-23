resource "oci_identity_tag_namespace" "this" {
  for_each       = var.tag_namespace_params
  compartment_id = var.compartments[each.value.compartment_name]
  description    = each.value.description
  name           = each.value.name
}

resource "oci_identity_tag" "this" {
  for_each         = var.tag_key_params
  description      = each.value.description
  name             = each.value.name
  tag_namespace_id = oci_identity_tag_namespace.this[each.value.tagnamespace_name].id

  is_cost_tracking = each.value.is_cost_tracking
  validator {
    validator_type = each.value.validator_type
    values         = each.value.values
  }
}
