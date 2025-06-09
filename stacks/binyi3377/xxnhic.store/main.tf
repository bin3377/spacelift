module "origin" {
  source = "../../../modules/cloudflare/origin"

  zone_id         = var.zone_id
  origin_ip       = var.origin_ip
  custom_hostname = var.custom_hostname
}
