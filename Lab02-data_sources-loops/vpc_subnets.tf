resource "aws_vpc" "vpc-lab02" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-lab02"
  }
}

resource "aws_subnet" "subnet" {
  /* count      = length(var.az_list) */
  count             = length(data.aws_availability_zones.az.names)
  availability_zone = element(data.aws_availability_zones.az.names, count.index)
  /* availability_zone = element(var.az_list, count.index)  */
  vpc_id     = aws_vpc.vpc-lab02.id
  cidr_block = element(var.subnet_cidr, count.index)


  tags = {
    Name = "Subnet - ${count.index + 1}"
  }

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-lab02.id

  tags = {
    "Name" = "InternetGW"
  }

}

resource "aws_route_table" "web_public_rt" {
  vpc_id = aws_vpc.vpc-lab02.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    "Name" = "Public Subnet-RT"
  }
}

resource "aws_route_table_association" "public-subnet" {
  count          = length(var.subnet_cidr)
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = aws_route_table.web_public_rt.id



}
