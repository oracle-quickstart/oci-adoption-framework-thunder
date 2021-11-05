output "blockchain" {
  value = { for platform in oci_blockchain_blockchain_platform.this :
    platform.display_name => platform.service_endpoint
  }
}
