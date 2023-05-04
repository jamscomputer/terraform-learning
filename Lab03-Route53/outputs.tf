output "elb_dns_name" {
    value = aws_elb.my_elb.dns_name
  
}

/* output "server1_eip" {
    value = aws_instance.server.*.public_ip[0]
  
} */