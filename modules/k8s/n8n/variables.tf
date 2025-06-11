variable "namespace" {
  type        = string
  description = "the namespace to use for the n8n"
  default     = "n8n"
}

variable "chart_version" {
  type        = string
  description = "the chart version to use for the n8n"
  default     = "1.0.7"
}

variable "image_tag" {
  type        = string
  description = "the tag of the image"
  default     = "1.95.3"
}

variable "hostname" {
  type        = string
  description = "the hostname for the n8n site."
}
