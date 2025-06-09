data "oci_containerengine_cluster_kube_config" "this" {
  cluster_id = var.cluster_ocid
}

locals {
  kubeconfig_cluster   = yamldecode(data.oci_containerengine_cluster_kube_config.this.content)["clusters"][0]["cluster"]
  kubeconfig_user_exec = yamldecode(data.oci_containerengine_cluster_kube_config.this.content)["users"][0]["user"]["exec"]
}

provider "kubernetes" {
  host                   = local.kubeconfig_cluster["server"]
  cluster_ca_certificate = base64decode(local.kubeconfig_cluster["certificate-authority-data"])

  exec {
    api_version = local.kubeconfig_user_exec["apiVersion"]
    args        = local.kubeconfig_user_exec["args"]
    command     = local.kubeconfig_user_exec["command"]
  }
}

module "nginx_ingress" {
  source      = "../../../modules/k8s/nginx_ingress"
  certificate = var.origin_cert
  private_key = var.origin_private_key
}
