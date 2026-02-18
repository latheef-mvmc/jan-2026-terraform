

resource "aws_ebs_volume" "db_data_volume" {
  for_each = {
    dev  = {
      size = 20
    }
    prod = {
      size = 50
    }
    qa   = {
      size = 30
    }
  }
  availability_zone = "ap-south-1a"
  size              = each.value.size
  type              = "gp3"
  encrypted         = true
}

resource "aws_instance" "webservers" {
  ami           = "ami-0ced6a024bb18ff2e"
  for_each = {
      
       dev = "t2.micro"
       prod = "t3.micro"
       qa = "t3.small"
       
  }
  instance_type = each.value
  key_name = "august"
  subnet_id     = aws_subnet.pub_network1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.app_sg[each.key].id]
  
  user_data = file(
    each.key == "dev"  ? "nginx.sh" :
    each.key == "prod" ? "httpd.sh" :
    "docker.sh"
  )
  tags = {
    Name = each.key
    
  }
}
  
  output "server_public_ips" {

  value = {
    for env, instance in aws_instance.webservers :
    env => instance.public_ip
  }

}

  