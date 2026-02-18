#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Hello i am Prod Server from $(hostname -f)" > /var/www/html/index.html