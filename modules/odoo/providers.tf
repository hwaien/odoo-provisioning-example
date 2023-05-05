terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path            = var.kube_config_path
    host                   = var.kube_host
    token                  = var.kube_token
    client_certificate     = var.kube_client_certificate
    client_key             = var.kube_client_key
    cluster_ca_certificate = var.kube_cluster_ca_certificate
  }
}