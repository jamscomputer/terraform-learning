resource "aws_vpc" "vpc-lab05" {
    cidr_block = var.vpc_cidr
    instance_tenancy = var.vpc_tenancy

    tags = {
      "Name" = "vpc-lab05"
    }
  
}

resource "aws_subnet" "subnet-1" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr

    tags = {
      "name" = "subnet-1"
    }
  
}