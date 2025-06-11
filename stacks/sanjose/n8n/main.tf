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
    env = {
      "OCI_CLI_USER"        = var.user_ocid,
      "OCI_CLI_FINGERPRINT" = var.fingerprint,
      "OCI_CLI_TENANCY"     = var.tenancy_ocid,
      "OCI_CLI_KEY_FILE"    = var.private_key_path,
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = local.kubeconfig_cluster["server"]
    cluster_ca_certificate = base64decode(local.kubeconfig_cluster["certificate-authority-data"])

    exec {
      api_version = local.kubeconfig_user_exec["apiVersion"]
      args        = local.kubeconfig_user_exec["args"]
      command     = local.kubeconfig_user_exec["command"]
      env = {
        "OCI_CLI_USER"        = var.user_ocid,
        "OCI_CLI_FINGERPRINT" = var.fingerprint,
        "OCI_CLI_TENANCY"     = var.tenancy_ocid,
        "OCI_CLI_KEY_FILE"    = var.private_key_path,
      }
    }
  }
}

module "n8n" {
  source = "../../../modules/k8s/n8n"
  hostname = var.hostname
}
