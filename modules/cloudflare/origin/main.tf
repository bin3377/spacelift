data "cloudflare_zone" "this" {
  zone_id = var.zone_id
}

resource "cloudflare_dns_record" "origin" {
  zone_id = var.zone_id
  name    = "origin.${data.cloudflare_zone.this.name}"
  content = var.origin_ip
  proxied = true
  ttl     = 1
  type    = "A"
}

resource "cloudflare_dns_record" "edge" {
  zone_id = var.zone_id
  name    = "edge.${data.cloudflare_zone.this.name}"
  content = var.edge_cname
  proxied = false
  ttl     = 1
  type    = "CNAME"
}

resource "cloudflare_custom_hostname_fallback_origin" "this" {
  zone_id = var.zone_id
  origin  = cloudflare_dns_record.origin.name
}

resource "cloudflare_custom_hostname" "this" {
  for_each = toset(var.custom_hostnames)
  zone_id  = var.zone_id
  hostname = each.value
}
