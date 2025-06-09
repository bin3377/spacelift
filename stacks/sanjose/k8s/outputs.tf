output "cluster_ocid" {
  description = "ocid of the cluster created"
  value       = module.cluster.cluster_id
}

output "node_pool_ocid" {
  description = "ocid of the node pool created"
  value       = module.cluster.node_pool_id
}

output "kubeconfig" {
  description = "the YAML content of kubeconfig of kubernetes cluster created"
  value       = module.cluster.kubeconfig
}
  