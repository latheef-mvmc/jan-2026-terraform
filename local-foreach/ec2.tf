locals {

  environments = {
    dev = {
      instance_type = "t2.micro"
    }

    qa = {
      instance_type = "t3.micro"
    }

    prod = {
      instance_type = "t3.small"
    }
  }

  common_tags = {
    Project   = var.project
    ManagedBy = "Terraform"
  }
}




resource "aws_instance" "local_instance" {
  ami = "ami-0ced6a024bb18ff2e"
  for_each = local.environments
  instance_type = each.value.instance_type
  subnet_id     = aws_subnet.pub_network1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.app_sg[var.env].id]
 

  tags = merge(
    local.common_tags,
    {
      Name        = "${var.project}-${each.key}-webserver"
      Environment = each.key
    }
  )
}
