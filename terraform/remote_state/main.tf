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


module "cluster_state" {
  source = "../modules/state"
}
