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

variable "compartment_ocid" {
  type        = string
  description = "the compartment ocid of oci-cli"
}

variable "cluster_ocid" {
  type        = string
  description = "the cluster ocid"
}

variable "origin_cert" {
  type        = string
  description = "the origin certificate"
}

variable "origin_private_key" {
  type        = string
  description = "the origin private key"
}
