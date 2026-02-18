resource "aws_internet_gateway" "ladsoft_vpc_igw" {
    vpc_id = aws_vpc.ladsoft_vpc.id
    
    tags = {
        Name = "${var.vpc_name}_igw"
    }
  
}
