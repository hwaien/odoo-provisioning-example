resource "helm_release" "odoo" {
  chart             = "${path.module}/my-odoo-helm-chart"
  name              = "odoo"
  dependency_update = true
  timeout           = 900

  set {
    name  = "odoo.odooEmail"
    value = var.odoo_email
  }

  set {
    name  = "odoo.ingress.hostname"
    value = var.odoo_ingress_hostname
  }

  set {
    name  = "nginx-ingress-controller.service.annotations.service\\.beta\\.kubernetes\\.io/do-loadbalancer-name"
    value = var.odoo_load_balancer_name
  }

  set {
    name  = "nginx-ingress-controller.service.annotations.service\\.beta\\.kubernetes\\.io/do-loadbalancer-certificate-id"
    value = var.odoo_load_balancer_certificate_id
  }
}