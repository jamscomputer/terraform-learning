resource "aws_instance" "app-1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  count                       = var.ec2_count
  
  tags = {
    "name" = "app-1"
  }
}