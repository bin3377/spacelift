module "mysql" {
  source            = "../../../modules/oci/mysql"
  compartment_id    = var.compartment_ocid
  private_subnet_id = var.private_subnet_ocid
  admin_username    = var.admin_username
  admin_password    = var.admin_password
}
