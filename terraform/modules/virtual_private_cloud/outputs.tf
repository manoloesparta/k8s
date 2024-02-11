output "vpc_id" {
  description = "VPC id for cluster"
  value       = aws_vpc.cluster.id
}

output "subnet_id" {
  description = "Sunet id for provisioning instances"
  value       = aws_subnet.subnet.id
}