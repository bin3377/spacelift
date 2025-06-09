terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 7.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.37"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.17"
    }
    mysql = {
      source  = "petoju/mysql"
      version = ">= 3.0.76"
    }
  }
}
