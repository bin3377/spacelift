variable "compartment_ocid" {
  type        = string
  description = "The compartment to create all resources in"
}

variable "ssh_public_key" {
  type        = string
  description = "The public key for SSH to worker node."
  default     = null
}

variable "freeform_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default = {
    deployed_by = "terraform"
  }
}

variable "defined_tags" {
  description = "predefined and scoped to a namespace to tag the resources created using defined tags."
  type        = map(string)
  default     = {}
}

variable "vcn_ocid" {
  description = "ocid of vcn created"
  type        = string
}

variable "private_subnet_ocid" {
  description = "ocid of private subnet created"
  type        = string
}

variable "public_subnet_ocid" {
  description = "ocid of public subnet created"
  type        = string
}
