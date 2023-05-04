terraform {
  cloud {
    organization = "jamscomputer-terraform"

    workspaces {
      name = "Lab02-data_sources_loops"
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