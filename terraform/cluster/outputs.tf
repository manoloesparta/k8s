output "nodes_ips" {
  value = { for node in module.worker_nodes.instances : node.tags.Name => node.public_ip }
}
