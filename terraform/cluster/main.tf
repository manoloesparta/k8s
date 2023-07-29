terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
  backend "s3" {
    bucket         = "cluster-state-k8s-reyes-magos"
    key            = "cluster/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cluster-state-locks-k8s-reyes-magos"
    encrypt        = true
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["$HOME/.aws/credentials"]
}

module "k8s_cluster" {
  source      = "../modules/vpc"
  vpc_name    = "k8s vpc"
  subnet_name = "k8s subnet"
  ig_name     = "k8s internet gateway"
  rt_name     = "k8s route table"
}

module "k8s_nodes" {
  source    = "../modules/instances"
  sg_name   = "k8s security group"
  vpc_id    = module.k8s_cluster.vpc_id
  subnet_id = module.k8s_cluster.subnet_id
}

module "k8s_public_api" {
  source       = "../modules/lb"
  lb_name      = "k8s-public-api"
  instance_ids = module.k8s_nodes.instance_ids
}
