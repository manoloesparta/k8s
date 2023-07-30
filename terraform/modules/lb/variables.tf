variable "lb_name" {
  description = "Load balancer name"
  type        = string
}

variable "subnet_id" {
  description = "VPCs subnet"
  type        = string
}

variable "vpc_id" {
  description = "K8S cluster VPC id"
  type        = string
}
