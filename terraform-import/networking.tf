resource "aws_vpc" "import_vpc" {
  cidr_block = "20.0.0.0/16"
  enable_dns_support   = true
  tags = {
    Name = "import_vpc"
    }
  }

  resource "aws_subnet" "import_subnet" {
    vpc_id = aws_vpc.import_vpc.id
    cidr_block = "20.0.1.0/24"
    tags = {
      Name = "import_subnet"
    }
  }

  resource "aws_internet_gateway" "import_igw" {
    vpc_id = aws_vpc.import_vpc.id
      tags = {
        Name = "import_igw"
      }
  }

  resource "aws_route_table" "import_route_table" {
    vpc_id = aws_vpc.import_vpc.id
    tags = {
      Name = "import_route_table"
    }
  } 
  resource "aws_route_table_association" "import_route_table_association" {
    subnet_id = aws_subnet.import_subnet.id
    route_table_id = aws_route_table.import_route_table.id
    
  }

  
