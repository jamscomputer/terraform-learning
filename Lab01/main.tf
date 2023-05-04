terraform {
  #backend to terraform cloud
  backend "remote" {
    organization = "jamscomputer-terraform"

    # project on terraform cloud
    workspaces {
      name = "Example-Workspace"
    }

  }
  #provider used	
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  #version required
  required_version = ">= 1.1.0"
}

#default region
provider "aws" {
  /* profile = "default" */
  region  = var.region
}
