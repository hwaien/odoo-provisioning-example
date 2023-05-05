variable "kube_config_path" {
  description = "The file system path of the Kubernetes configuration file."
  type        = string
  default     = null
}

variable "kube_host" {
  description = "The hostname (in form of URI) of the Kubernetes API."
  type        = string
  default     = null
}

variable "kube_token" {
  description = "The bearer token to use for authentication when accessing the Kubernetes API."
  type        = string
  default     = null
}

variable "kube_client_certificate" {
  description = "PEM-encoded client certificate for TLS authentication."
  type        = string
  default     = null
}

variable "kube_client_key" {
  description = "PEM-encoded client certificate key for TLS authentication."
  type        = string
  default     = null
}

variable "kube_cluster_ca_certificate" {
  description = "PEM-encoded root certificates bundle for TLS authentication."
  type        = string
  default     = null
}

variable "odoo_ingress_hostname" {
  description = "Default host for the ingress record."
  type        = string
  default     = "localhost"
}

variable "odoo_load_balancer_name" {
  description = "Name of the load balancer."
  type        = string
  default     = "localhost"
}