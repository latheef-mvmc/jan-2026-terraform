##Public Route Table
resource "aws_route_table" "august_batch_vpc_public_rt" {
  vpc_id = aws_vpc.august_batch_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.august_batch_vpc_igw.id
  }
    tags = {
        Name = "AugustBatchVPC-Public-RT"
    }
}

resource "aws_route_table_association" "august_batch_vpc_main_rt_assoc" {
  subnet_id      = aws_subnet.pub_network1.id
  route_table_id = aws_route_table.august_batch_vpc_public_rt.id
 
}
##Private Route Table
resource "aws_route_table" "august_batch_vpc_private_rt" {
  vpc_id = aws_vpc.august_batch_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.august_batch_vpc_nat_gw.id
  }
    tags = {
        Name = "AugustBatchVPC-Private-RT"
    }
}

resource "aws_route_table_association" "august_batch_vpc_private_rt_assoc" {
  subnet_id      = aws_subnet.pvt_subnet1.id
  route_table_id = aws_route_table.august_batch_vpc_private_rt.id
 
}

