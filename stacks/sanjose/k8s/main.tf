module "cluster" {
  source             = "../../../modules/oci/k8s"
  compartment_id     = var.compartment_ocid
  kubernetes_version = "v1.33.0"
  prefix             = "k8s"
  node_shape_config = {
    memory_in_gbs = 12
    ocpus         = 2
  }
  vcn_id            = var.vcn_ocid
  private_subnet_id = var.private_subnet_ocid
  public_subnet_id  = var.public_subnet_ocid
  ssh_public_key    = var.ssh_public_key
  enable_dashboard  = false
  enable_tiller     = true

  defined_tags  = var.defined_tags
  freeform_tags = var.freeform_tags
}
