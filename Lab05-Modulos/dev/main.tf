provider "aws" {
  region = "us-east-2"

}

terraform {
  cloud {
    organization = "jamscomputer-terraform"

    workspaces {
      name = "Lab05-Modulos"
    }
  }
}

module "vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "172.0.0.0/16"
  vpc_tenancy = "default"
  vpc_id      = module.vpc.vpc_id
  subnet_cidr = "172.0.1.0/24"
}

module "ec2" {
  source        = "../modules/ec2"
  ec2_count     = 1
  ami_id        = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  subnet_id = module.vpc.subnet_id

}
