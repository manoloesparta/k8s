output "public_domain" {
  value       = aws_lb.load_balancer.dns_name
  description = "Public IP of Load Balancer"
}
