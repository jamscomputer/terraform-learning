terraform {
  cloud {
    organization = "jamscomputer-terraform"

    workspaces {
      name = "Lab03-route53"
    }
  }

   #provider used	
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20"
    }
  }
}

provider "aws" {
    region = var.region 
}