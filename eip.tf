resource "aws_eip" "august_vpc_eip" {
  domain = "vpc"
  tags = {
    Name = "AugustBatchVPC-EIP"
  }
  
}

resource "aws_nat_gateway" "august_batch_vpc_nat_gw" {
  allocation_id = aws_eip.august_vpc_eip.id
  subnet_id     = aws_subnet.pub_network1.id

  tags = {
    Name = "August_NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.august_batch_vpc_igw]
                
}