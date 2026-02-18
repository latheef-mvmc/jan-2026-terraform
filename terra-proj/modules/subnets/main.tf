resource "aws_subnet" "pub_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.Public_subnet_cidr
  availability_zone = var.az1
  
  tags = {
    Name = var.public_subnet_name
  }
}
resource "aws_subnet" "priv_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.Private_subnet_cidr
  availability_zone = var.az2
  tags = {
    Name = var.private_subnet_name
  }
}