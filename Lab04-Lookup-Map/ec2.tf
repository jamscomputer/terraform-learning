resource "aws_instance" "web1" {
  ami = "${lookup(var.ec2_ami, var.region)}"
  instance_type               = "t2.micro"

  tags = {
    Name  = "Web1"
    Owner = "Terraform"
    Env   = "Testing"
  }
  
}