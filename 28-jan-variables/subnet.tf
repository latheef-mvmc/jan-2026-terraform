resource "aws_subnet" "ladsoft_public_subnet" {
    vpc_id            = aws_vpc.ladsoft_vpc.id
    cidr_block       = var.public_subnet_cidr
    availability_zone = var.az_zone1
    tags = {
        Name = var.public_subnet_name 
    }
  
}

resource "aws_subnet" "ladsoft_private_subnet" {
    vpc_id            = aws_vpc.ladsoft_vpc.id
    cidr_block       = var.private_subnet_cidr
    availability_zone = var.az_zone2
    tags = {
        Name = var.private_subnet_name 
    }
  
}