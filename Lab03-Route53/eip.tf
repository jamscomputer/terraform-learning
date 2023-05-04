/* #creating an EIP
resource "aws_eip" "eip_1" {
    vpc = true

    tags = {
      "name" = "EIP server 1"
    }
  
}

#Associate EIP with instance server 1
resource "aws_eip_association" "eip_server1" {
    instance_id = aws_instance.server.*.id[0]
    allocation_id = aws_eip.eip_1.id
  
} */