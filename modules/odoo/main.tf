resource "helm_release" "odoo" {
  name    = "odoo"
  timeout = 900
  chart   = "${path.module}/my-odoo-helm-chart"

  set {
    name  = "odoo.ingress.hostname"
    value = var.odoo_ingress_hostname
  }

  set {
    name  = "nginx-ingress-controller.service.annotations.service\\.beta\\.kubernetes\\.io/do-loadbalancer-name"
    value = var.odoo_load_balancer_name
  }
}