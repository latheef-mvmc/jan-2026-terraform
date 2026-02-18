resource "aws_subnet" "ladsoft_public_subnet" {
    vpc_id            = aws_vpc.ladsoft_vpc.id
    cidr_block       = var.public_subnet_cidr
    availability_zone = var.az_zone1
    tags = {
        Name = var.public_subnet_name 
    }
  
}

# resource "aws_subnet" "ladsoft_private_subnet" {
#     vpc_id            = aws_vpc.ladsoft_vpc.id
#     cidr_block       = var.private_subnet_cidr
#     availability_zone = var.az_zone2
#     tags = {
#         Name = var.private_subnet_name 
#     }
  
# }

resource "aws_route_table" "ladsoft_RT" { 
    vpc_id = aws_vpc.ladsoft_vpc.id
    route { 
      
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ladsoft_igw.id
      }
    
    tags = {
        Name = "ladsoft-route-table"
        Environment = var.env
    }    
  
}
resource "aws_route_table_association" "ladsoft_public_RT_association" {
    subnet_id      = aws_subnet.ladsoft_public_subnet.id
    route_table_id = aws_route_table.ladsoft_RT.id
}
