variable "sg_name" {
  description = "Security group name for instances"
  type        = string
  default     = "security group"
}

variable "vpc_id" {
  description = "VPC id for instances"
  type        = string
}

variable "subnet_id" {
  description = "Subnet id for instances"
  type        = string
}

variable "node_prefix" {
  description = "Prefix for instances"
  type        = string
  default     = "node"
}

variable "instance_shape" {
  description = "Instance shape type"
  type        = string
  default     = "t2.medium"
}

variable "instance_ami" {
  description = "Instance AMI"
  type        = string
  default     = "ami-00874d747dde814fa"
}