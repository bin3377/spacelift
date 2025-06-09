
output "db_ip" {
  value = module.mysql.ip
}

output "db_port" {
  value = module.mysql.port
}

output "db_username" {
  value = var.admin_username
}

output "db_password" {
  value     = var.admin_password
  sensitive = true
}
