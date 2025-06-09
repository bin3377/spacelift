variable "compartment_ocid" {
  type        = string
  description = "The compartment to create all resources in"
}

variable "private_subnet_ocid" {
  type        = string
  description = "The id of the private subnet."
}

variable "admin_username" {
  type        = string
  description = "The admin username for the MySQL DB System."
  default     = "admin"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "The admin password for the MySQL DB System."
}
