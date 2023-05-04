#creating an EC2 instance
resource "aws_instance" "server" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet1.id
  count = "${length(var.private_ip_subnet1)}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg-1.id}", "${aws_security_group.sg-2.id}"]
  private_ip                  = "${element(var.private_ip_subnet1, count.index)}"
  key_name                    = aws_key_pair.key-1.id
  iam_instance_profile        = aws_iam_instance_profile.ec2_connect_profile.name
  user_data                   = file("ec2_user-data.sh")

  tags = {
    Name  = "Server-${count.index + 1 }"
    Owner = "Terraform"
    Env   = "dev"
  }
}



