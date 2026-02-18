resource "aws_subnet" "pub_network1" {
    vpc_id = aws_vpc.august_batch_vpc.id
    cidr_block = "60.0.1.0/24"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "august_vpc_PublicNetwork1"
    }
}

resource "aws_subnet" "pvt_subnet1" {
    vpc_id = aws_vpc.august_batch_vpc.id
    cidr_block = "60.0.2.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "august_vpc_PrivateNetwork1"
    }
}
#aws_subnet.pvt_subnet1.id"

