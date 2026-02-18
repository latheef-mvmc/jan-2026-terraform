resource "aws_instance" "demo_instance" {
  ami = "ami-0ced6a024bb18ff2e"
  instance_type = "t2.micro"
  key_name = "august"
  subnet_id = aws_subnet.ladsoft_public_subnet.id
  vpc_security_group_ids = [aws_security_group.ladsoft_sg.id]
  associate_public_ip_address = true

  provisioner "local-exec" {
  command = <<EOT

echo "Private IP: ${self.private_ip}" >> IP.txt , echo "Public IP: ${self.public_ip}" >> IP.txt
EOT
  }
        

# provisioner "file" {
#     source      = "E:/aws-augjust-batch/provisioners-5th-feb-2026/httpd.sh"
#     destination = "/tmp/httpd.sh"
#     }

#   connection  {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("E:/aws-augjust-batch/provisioners-5th-feb-2026/august.pem")
#     host        = self.public_ip
#   }

#     provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/httpd.sh",
#       "sudo /tmp/httpd.sh"
#     ]
  
   # }
        tags = {
        Name = "DemoInstance"
        Environment = var.env
    }
}