#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Hello i am Dev Server from $(hostname -f)" > /usr/share/nginx/html/index.html
