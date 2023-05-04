variable "region" {
  description = "Region a utilizar para provisionar recursos AWS"
   default = "us-east-2" 
  
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
   default = "172.0.0.0/16" 
  
}

variable "subnet1_cidr" {
  description = "CIDR for Subnet1"
   default = "172.0.1.0/24" 
  
}

variable "az_list" {
    type = list
    default = ["us-east-2a","us-east-2b","us-east-2c"]  
}

variable "subnet_cidr" {
    type=list
    default = ["172.0.1.0/24","172.0.2.0/24","172.0.3.0/24"]

  
}

data "aws_availability_zones" "az" {
  
}