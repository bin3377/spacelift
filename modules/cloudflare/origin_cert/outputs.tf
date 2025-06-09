output "certificate" {
  value     = cloudflare_origin_ca_certificate.this.certificate
  sensitive = true
}

output "private_key" {
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}
