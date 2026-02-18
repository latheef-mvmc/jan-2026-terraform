#!/bin/bash

yum update -y
yum install docker -y

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

docker run -d -p 80:80 nginx
