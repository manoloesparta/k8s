terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["$HOME/.aws/credentials"]
}

module "k8s_cluster" {
  source      = "./cluster/vpc"
  vpc_name    = "k8s vpc"
  subnet_name = "k8s subnet"
  ig_name     = "k8s internet gateway"
  rt_name     = "k8s route table"
}

module "worker_nodes" {
  source    = "./cluster/instances"
  sg_name   = "k8s security group"
  vpc_id    = module.k8s_cluster.vpc_id
  subnet_id = module.k8s_cluster.subnet_id
}
