#!/bin/bash
sudo -i
yum update -y
yum install -y httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd


