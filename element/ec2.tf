resource "aws_instance" "pub1_instance" {
  ami = var.ami_id
  instance_type = var.ec2_environment == "prod" ? var.instance_type["prod"] : var.instance_type["dev"]
  #instance_type = var.ec2_environment == "prod" ? t2.medium : t2.micro
  subnet_id = aws_subnet.ladsoft_public_subnets["public-subnet-1"].id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.ladsoft_sg.id]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, we are testing user data script" > /var/www/html/index.html
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF
    tags = {
        Name = "Public-1-Instance"
        Environment = var.env[0]
    }
}

