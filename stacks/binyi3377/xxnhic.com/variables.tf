variable "zone_id" {
  type        = string
  description = "the zone id for the origin and edge records"
}

variable "target_validations" {
  type        = map(string)
  description = "host name to validation value"
  default     = {}
}

variable "edge_url" {
  type        = string
  description = "the edge url for edge CNAME record"
  default     = "edge.xxnhic.store"
}
