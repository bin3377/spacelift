variable "namespace" {
  type        = string
  description = "the namespace to use for the ingress controller"
  default     = "ingress-nginx"
}

variable "chart_version" {
  type        = string
  description = "the chart version to use for the ingress controller"
  default     = "4.12.2"
}

variable "certificate" {
  type        = string
  description = "the certificate to use for the ingress controller"
}

variable "private_key" {
  type        = string
  sensitive   = true
  description = "the private key to use for the ingress controller"
}
