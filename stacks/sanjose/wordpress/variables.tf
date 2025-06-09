variable "private_key_path" {
  type        = string
  description = "the path to the private key of oci-cli"
}

variable "fingerprint" {
  type        = string
  description = "the fingerprint of oci-cli"
}

variable "user_ocid" {
  type        = string
  description = "the user ocid of oci-cli"
}

variable "tenancy_ocid" {
  type        = string
  description = "the tenancy ocid of oci-cli"
}

variable "cluster_ocid" {
  type        = string
  description = "the cluster ocid"
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

variable "db_database" {
  type        = string
  description = "the database to use for the wordpress"
  default     = "wordpress"
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
