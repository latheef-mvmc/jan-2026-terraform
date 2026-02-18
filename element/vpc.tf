resource "aws_vpc" "ladsoft_vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
        Environment = var.env[0]
    }
  
}
#vpc_id: aws_vpc.ladsoft_vpc.id

