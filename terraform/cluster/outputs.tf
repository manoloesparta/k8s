output "worker_node_ips" {
  value = { for node in module.k8s_nodes.worker_nodes : node.tags.Name => node.public_ip }
}

output "controller_node_ips" {
  value = { for node in module.k8s_nodes.controller_nodes : node.tags.Name => node.public_ip }
}

output "cluster_public_api" {
  value = module.k8s_public_api.public_domain
}
