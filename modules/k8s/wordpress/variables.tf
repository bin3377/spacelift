variable "namespace" {
  type        = string
  description = "the namespace to use for the wordpress"
  default     = "wordpress"
}

variable "chart_version" {
  type        = string
  description = "the chart version to use for the wordpress"
  default     = "24.2.7"
}

variable "db_ip" {
  type        = string
  description = "the ip of the db"
}

variable "db_port" {
  type        = string
  description = "the port of the db"
}

variable "db_username" {
  type        = string
  description = "the username for the MySQL DB System."
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "the password for the MySQL DB System."
}

variable "db_name" {
  type        = string
  description = "the name of the database."
}

variable "wordpress_username" {
  type        = string
  description = "the username for the WordPress."
}

variable "wordpress_password" {
  type        = string
  sensitive   = true
  description = "the password for the WordPress."
}

variable "wordpress_email" {
  type        = string
  description = "the email for the WordPress."
}

variable "hostname" {
  type        = string
  description = "the hostname for the WordPress site."
}
