#!/bin/bash
apt update -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx

echo "Hello from Terraform EC2 Web Server" > /var/www/html/index.html