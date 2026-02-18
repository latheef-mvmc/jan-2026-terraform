locals {
  name_prefix = "${var.project}-${var.env}"
  instance_type_map = {
    dev = "t2.micro"
    prod = "t3.micro"
    qa = "t3.small"
  }
  instance_type = local.instance_type_map[var.env]
  common_tags = {
    Project = var.project
    Environment = var.env
    ManagedBy = "Terraform"
  } 
}
resource "aws_instance" "local_instance" {
  ami = "ami-0ced6a024bb18ff2e"
  instance_type = local.instance_type
  subnet_id     = aws_subnet.pub_network1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.app_sg[var.env].id]

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-webserver"
    }
  )
}