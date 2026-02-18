resource "aws_route_table" "Ladsoft_pubrt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
    subnet_id      = var.public_subnet_id
    route_table_id = aws_route_table.Ladsoft_pubrt.id
  
}

resource "aws_route_table" "Ladsoft_privrt" {
  vpc_id = var.vpc_id
  
  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

resource "aws_route_table_association" "private_assoc" {
    subnet_id      = var.private_subnet_id
    route_table_id = aws_route_table.Ladsoft_privrt.id
}