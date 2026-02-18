resource "aws_internet_gateway" "august_batch_vpc_igw" {
  vpc_id = aws_vpc.august_batch_vpc.id

  tags = {
    Name = "AugustBatchVPC-IGW"
  }
}
#aws_internet_gateway.august_batch_vpc_igw.id