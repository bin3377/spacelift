data "cloudflare_zone" "this" {
  zone_id = var.zone_id
}

resource "cloudflare_dns_record" "cname" {
  for_each = var.target_validations
  zone_id  = var.zone_id
  name     = "${each.key}.${data.cloudflare_zone.this.name}"
  content  = var.edge_url
  proxied  = false
  ttl      = 1
  type     = "CNAME"
}

resource "cloudflare_dns_record" "validate_txt" {
  for_each = var.target_validations
  zone_id  = var.zone_id
  name     = "_cf-custom-hostname.${each.key}.${data.cloudflare_zone.this.name}"
  content  = each.value
  proxied  = false
  ttl      = 1
  type     = "TXT"
}

