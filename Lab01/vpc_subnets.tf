#creating a VPC
resource "aws_vpc" "test-vpc1" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "test-vpc1"
  }
}

#creating a subnet within the VPC
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.test-vpc1.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnet1_zone_2a

  tags = {
    Name = "subnet-1-test"
  }
}

#creating a subnet within the VPC 
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.test-vpc1.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnet2_zone_2b

  tags = {
    Name = "subnet-2-test"
  }
}
#creating a subnet within the VPC
resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.test-vpc1.id
  cidr_block              = var.subnet3_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnet3_zone_2c

  tags = {
    Name = "subnet-3-test"
  }
}
#creating an internet gateway to route traffic to internet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test-vpc1.id

  tags = {
    Name = "Gateway VPC1"
  }

}

#creating a route table to the internet using internet gateway
resource "aws_route_table" "r" {
  vpc_id = aws_vpc.test-vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id

  }

  tags = {
    "Name" = "route to Internet GW"
  }
}

#creating a route table association to the subnet1 using the route table to the internet
resource "aws_route_table_association" "table_subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.r.id

}
#creating a route table association to the subnet1 using the route table to the internet
resource "aws_route_table_association" "table_subnet2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.r.id

}
#creating a route table association to the subnet1 using the route table to the internet
resource "aws_route_table_association" "table_subnet3" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.r.id

}
