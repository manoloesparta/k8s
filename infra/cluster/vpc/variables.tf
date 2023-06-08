variable "vpc_name" {
  description = "VPC name for cluster"
  type        = string
  default     = "vpc"
}

variable "subnet_name" {
  description = "Subnet name for cluster"
  type        = string
  default     = "subnet"
}

variable "ig_name" {
  description = "Internet gateway name for cluster"
  type        = string
  default     = "internet gateway"
}

variable "rt_name" {
  description = "Route table name for cluster"
  type        = string
  default     = "route table"
}