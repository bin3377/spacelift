module "origin" {
  source = "../../../modules/cloudflare/origin"

  zone_id          = var.zone_id
  origin_ip        = var.origin_ip
  custom_hostnames = var.custom_hostnames
}
