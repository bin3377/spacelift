
output "ip" {
  value       = oci_mysql_mysql_db_system.this.endpoints[0].ip_address
  description = "The IP address of the MySQL DB System."
}

output "port" {
  value       = oci_mysql_mysql_db_system.this.endpoints[0].port
  description = "The port of the MySQL DB System."
}
