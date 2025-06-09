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
    args        = concat(
      local.kubeconfig_user_exec["args"],
      ["--compartment-id", var.compartment_ocid]
    )
    command     = local.kubeconfig_user_exec["command"]
    env         = [
      {
        name  = "OCI_CLI_USER"
        value = var.user_ocid
      },
      {
        name  = "OCI_CLI_FINGERPRINT"
        value = var.fingerprint
      },
      {
        name  = "OCI_CLI_TENANCY"
        value = var.tenancy_ocid
      },
      {
        name  = "OCI_CLI_KEY_FILE"
        value = var.private_key_path
      }
    ]
  }
}

module "nginx_ingress" {
  source      = "../../../modules/k8s/nginx_ingress"
  certificate = var.origin_cert
  private_key = var.origin_private_key
}
