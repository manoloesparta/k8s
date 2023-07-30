output "public_domain" {
  value       = aws_lb.load_balancer.dns_name
  description = "Public domain of Load Balancer"
}
