output "certificate" {
  value     = module.origin_cert.certificate
  sensitive = true
}

output "private_key" {
  value     = module.origin_cert.private_key
  sensitive = true
}
