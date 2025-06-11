resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "this" {
  depends_on = [kubernetes_namespace.this]
  name       = "n8n"
  namespace  = kubernetes_namespace.this.id
  repository = "oci://8gears.container-registry.com/library"
  chart      = "n8n"
  version    = var.chart_version

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name  = "image.tag"
    value = var.image_tag
  }

  set {
    name  = "ingress.hosts[0].host"
    value = var.hostname
  }
}
