resource "aws_internet_gateway" "ladsoft_igw" {
  vpc_id = aws_vpc.ladsoft_vpc.id

  tags = {
    Name = "ladsoft-internet-gateway"
    Environment = var.env
  }
}

