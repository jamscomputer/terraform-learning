  /* variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "AppServer-test"
}  */

variable "region" {
  description = "Region a utilizar para provisionar recursos AWS"
  /* default = "us-east-2" */
  
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  /* default = "172.0.0.0/16" */
  
}

variable "subnet1_cidr" {
  description = "CIDR for Subnet1"
  /* default = "172.0.1.0/24" */
  
}
variable "subnet2_cidr" {
  description = "CIDR for Subnet2"
  /* default = "172.0.2.0/24" */
  
}

variable "subnet3_cidr" {
  description = "CIDR for Subnet3"
  /* default = "172.0.3.0/24" */
  
}

variable "subnet1_zone_2a" {
  description = "Availability Zone for Subnet 1"
  /* default = "us-east-2a" */
  
}

variable "subnet2_zone_2b" {
  description = "Availability Zone for Subnet 2"
  /* default = "us-east-2b" */
  
}

variable "subnet3_zone_2c" {
  description = "Availability Zone for Subnet 3"
  /* default = "us-east-2c" */
  
}
variable "ami_id" {
  type = string
  description = "Amazon Linux 2 AMI ID"
  /* default = "ami-02d1e544b84bf7502" */
  
} 

variable "private_ip_subnet1" {
  description = "Private IPs for Subnet 1- Zone A"
  type = list
 default = ["172.0.1.10", "172.0.1.11", "172.0.1.13"]
  
  
}
