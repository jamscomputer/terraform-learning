variable "region" {
  description = "AWS Region"
  default     = "us-east-2"
}

variable "ec2_ami" {
  type = map
  description = "Amazon Linux 2 AMI ID"
  
  default = ({
     us-east-2 = "ami-02d1e544b84bf7502"
     us-west-1 = "ami-0d9858aa3c6322f73"
     us-west-2 = "ami-098e42ae54c764c35"
})
 
}

