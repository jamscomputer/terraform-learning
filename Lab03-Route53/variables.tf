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

variable "ami_id" {
  type = string
  description = "Amazon Linux 2 AMI ID"
  default = "ami-02d1e544b84bf7502"
  
} 

variable "private_ip_subnet1" {
  description = "Private IPs for Subnet 1- Zone A"
  type = list
 default = ["172.0.1.10", "172.0.1.11"]
  
  
}