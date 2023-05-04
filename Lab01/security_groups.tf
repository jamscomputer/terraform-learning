#creating a security group with inbound and outbound rules
resource "aws_security_group" "sg-1" {
  name        = "ICMP-SSH"
  vpc_id      = aws_vpc.test-vpc1.id
  description = "allow ICMP and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "ICMP_SSH"
  }
}


resource "aws_security_group" "sg-2" {
  name        = "HTTP-HTTPS-Traffic"
  vpc_id      = aws_vpc.test-vpc1.id
  description = "allow HTTP_HTTPS traffic"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "HTTP_HTTPS_traffic"
  }
}
