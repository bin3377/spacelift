output "cluster_id" {
  description = "the id of kubernetes cluster created"
  value       = oci_containerengine_cluster.this.id
}

output "node_pool_id" {
  description = "the id of node pool created"
  value       = oci_containerengine_node_pool.this.id
}

output "kubeconfig" {
  description = "the YAML content of kubeconfig of kubernetes cluster created"
  value       = data.oci_containerengine_cluster_kube_config.this.content
}
