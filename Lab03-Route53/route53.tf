resource "aws_route53_zone" "testing" {
    name = "testing.jamscomputer.com"
    force_destroy = false

  vpc {
    vpc_id = aws_vpc.vpc-lab03.id
  }

    tags = {
    Environment = "Testing"
  }
  

}

resource "aws_route53_record" "server1" {
    zone_id = aws_route53_zone.testing.zone_id
    name = "server1.testing.jamscomputer.com"
    type = "A"
    ttl = "300"
    records = [aws_instance.server.*.private_ip[0]]  
}

resource "aws_route53_record" "server2" {
    zone_id = aws_route53_zone.testing.zone_id
    name = "server2.testing.jamscomputer.com"
    type = "A"
    ttl = "300"
    records = [aws_instance.server.*.private_ip[1]]  
}

resource "aws_route53_record" "my_elb" {
    zone_id = aws_route53_zone.testing.zone_id
    name = "myelb.testing.jamscomputer.com"
    type = "CNAME"
    ttl = "300"
    records = [aws_elb.my_elb.dns_name]  
}