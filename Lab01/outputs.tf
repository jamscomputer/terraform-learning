 /* output "instance_id_server1" {
  description = "ID of the EC2 instance"
  value       = aws_instance.server1.id
}

output "instance_public_ip_server1" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.server1.public_ip
}

output "instance_id_server2" {
  description = "ID of the EC2 instance"
  value       = aws_instance.server2.id
}

output "instance_public_ip_server2" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.server2.public_ip
} 

 output "admin1_access_key" {
  value = aws_iam_access_key.admin1-access.id

}

output "admin1_secret_key" {
  value = aws_iam_access_key.admin1-access.secret
  sensitive = true

}  */
