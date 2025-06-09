output "load_balancer_public_ip" {
  value = data.kubernetes_service.controller.status[0].load_balancer[0].ingress[0].ip
}
