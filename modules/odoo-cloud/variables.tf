variable "odoo_domain" {
  description = "The domain. The 'bar.com' part of 'foo.bar.com'"
  type        = string
}

variable "odoo_subdomain" {
  description = "The subdomain. The 'foo' part of 'foo.bar.com'"
  type        = string
}

variable "doks_cluster_region" {
  description = "The slug identifier for the region where the Kubernetes cluster will be created."
  type        = string
}

variable "doks_cluster_version" {
  description = "The slug identifier for the version of Kubernetes used for the cluster."
  type        = string
}

variable "doks_cluster_pool_size" {
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
  type        = string
}

variable "doks_cluster_pool_node_count" {
  description = "The number of Droplet instances in the node pool."
  type        = string
}