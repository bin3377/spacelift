module "origin_cert" {
  source = "../../../modules/cloudflare/origin_cert"
  dns_names = [
    "*.xxnhic.store",
    "xxnhic.store",
  ]
}
