resource "digitalocean_kubernetes_cluster" "my_cluster" {
  name    = "${var.odoo_subdomain}-cluster"
  region  = var.doks_cluster_region
  version = var.doks_cluster_version

  node_pool {
    name       = "${var.odoo_subdomain}-pool"
    size       = var.doks_cluster_pool_size
    node_count = var.doks_cluster_pool_node_count
  }
}

module "odoo" {
  source                  = "../odoo"
  odoo_load_balancer_name = "${var.odoo_subdomain}-load-balancer"
  odoo_ingress_hostname   = "${var.odoo_subdomain}.${var.odoo_domain}"
  kube_host               = digitalocean_kubernetes_cluster.my_cluster.endpoint
  kube_token              = digitalocean_kubernetes_cluster.my_cluster.kube_config[0].token
  kube_client_certificate = base64decode(
    digitalocean_kubernetes_cluster.my_cluster.kube_config[0].client_certificate
  )
  kube_client_key = base64decode(
    digitalocean_kubernetes_cluster.my_cluster.kube_config[0].client_key
  )
  kube_cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.my_cluster.kube_config[0].cluster_ca_certificate
  )
}

data "digitalocean_loadbalancer" "my_load_balancer" {
  depends_on = [ module.odoo ]
  name       = module.odoo.load_balancer_name
}

data "cloudflare_zone" "my_zone" {
  name = var.odoo_domain
}

resource "cloudflare_record" "my_dns_record" {
  zone_id = data.cloudflare_zone.my_zone.id
  name    = var.odoo_subdomain
  value   = data.digitalocean_loadbalancer.my_load_balancer.ip
  type    = "A"
  proxied = true
}