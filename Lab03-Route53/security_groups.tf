resource "aws_security_group" "route_allow_http_ssh" {
    name = "route53 allow_icmp_ssh_apache"
    vpc_id = aws_vpc.vpc-lab03.id

    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = ["${aws_security_group.http_elb.id}"]
    }

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    
    ingress{
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
  
}

resource "aws_security_group" "http_elb" {
    name = "allow_http_elb"
    vpc_id = aws_vpc.vpc-lab03.id

    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

     egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

}