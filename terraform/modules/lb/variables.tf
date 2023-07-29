variable "lb_name" {
  description = "Load balancer name"
  type        = string
  default = "load-balancer"
}

variable "instance_ids" {
  description = "Instance to distribute load"
  type        = list(string)
}
