resource "aws_instance" "server" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet.*.id[0]
  count                       = length(var.private_ip_subnet1)
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.route_allow_http_ssh.id}"]
  private_ip                  = element(var.private_ip_subnet1, count.index)
  iam_instance_profile        = aws_iam_instance_profile.ec2_connect_profile.name
  user_data                   = file("ec2_user-data.sh")

  tags = {
    Name  = "Server- ${count.index + 1} "
    Owner = "Terraform"
    Env   = "Testing"
  }
}
