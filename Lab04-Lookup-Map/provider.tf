terraform {
  cloud {
    organization = "jamscomputer-terraform"

    workspaces {
      name = "Lab04-Lookup-Map"
    }
  }
}

provider "aws" {
    region = var.region 
}