output "vcn_ocid" {
  description = "ocid of vcn created"
  value       = module.network.vcn_id
}

output "private_subnet_ocid" {
  description = "ocid of private subnet created"
  value       = module.network.private_subnet_id
}

output "public_subnet_ocid" {
  description = "ocid of public subnet created"
  value       = module.network.public_subnet_id
}
