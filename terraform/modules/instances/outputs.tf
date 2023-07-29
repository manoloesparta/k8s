output "worker_nodes" {
  value = aws_instance.worker_nodes
}

output "controller_nodes" {
  value = aws_instance.controller_nodes
}

output "instance_ids" {
  value = concat(
    [for node in aws_instance.controller_nodes : node.id],
    [for node in aws_instance.worker_nodes : node.id],
  )
}