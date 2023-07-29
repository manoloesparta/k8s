output "worker_node_ips" {
  value = { for node in module.k8s_nodes.worker_nodes : node.tags.Name => node.public_ip }
}

output "controller_node_ips" {
  value = { for node in module.k8s_nodes.controller_nodes : node.tags.Name => node.public_ip }
}

output "test" {
  value = module.k8s_nodes.instance_ids
}