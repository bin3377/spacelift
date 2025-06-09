module "network" {
  source                   = "../../../modules/oci/network"
  compartment_id           = var.compartment_id
  prefix                   = "k8s"
  enable_ipv6              = false
  vcn_cidr                 = "10.0.0.0/16"
  private_subnet_cidr      = "10.0.0.0/24"
  public_subnet_cidr       = "10.0.1.0/24"
  public_subnet_open_ports = [80, 443, 6443] // HTTP, HTTPS, Kubectl

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags
}
