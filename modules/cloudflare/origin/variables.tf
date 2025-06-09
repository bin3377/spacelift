variable "zone_id" {
  type        = string
  description = "the zone id for the origin and edge records"
}

variable "origin_ip" {
  type        = string
  description = "the origin server ip for origin A record"
}

variable "edge_cname" {
  type        = string
  description = "the edge cname for edge CNAME record"
  default     = "cloudflare.182682.xyz"
}

variable "custom_hostnames" {
  type        = list(string)
  description = "the custom hostnames"
}
