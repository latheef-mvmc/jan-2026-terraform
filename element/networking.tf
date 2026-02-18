# # resource "aws_subnet" "ladsoft_public_subnet" {
# #   for_each = toset(var.public_subnet_cidrs)

# #   vpc_id            = aws_vpc.ladsoft_vpc.id
# #   cidr_block        = each.value
# #   availability_zone = var.az_zones[index(var.public_subnet_cidrs, each.value)]

# #   tags = {
# #     Name = "${var.vpc_name}_public-${each.value}"   
# #   }
# # }


# # resource "aws_subnet" "ladsoft_private_subnet" {
# #   for_each = toset(var.private_subnet_cidrs)

# #   vpc_id            = aws_vpc.ladsoft_vpc.id
# #   cidr_block        = each.value
# #   availability_zone = var.az_zones[index(var.private_subnet_cidrs, each.value)]
  

# #   tags = {
# #     Name = "${var.vpc_name}_private-${each.value}"
# #   }
# }


# # resource "aws_subnet" "ladsoft_public_subnet" {
# #     count = length(var.public_subnet_cidrs)
# #     vpc_id            = aws_vpc.ladsoft_vpc.id
# #     cidr_block       = var.public_subnet_cidrs[count.index]
# #     availability_zone = var.az_zones[count.index]
# #     tags = {
# #         Name = "${var.vpc_name}_public-subnet-${count.index + 1}"
# #     }
  
# # }

# # resource "aws_subnet" "ladsoft_private_subnet" {
# #     count = length(var.private_subnet_cidrs)
# #     vpc_id            = aws_vpc.ladsoft_vpc.id
# #     cidr_block       = var.private_subnet_cidrs[count.index]
# #     availability_zone = var.az_zones[count.index]
# #     tags = {
# #         Name = "${var.vpc_name}_private-subnet-${count.index + 1}"
# #     }
  
# # }

resource "aws_subnet" "ladsoft_public_subnets" {
  for_each = var.public_subnets
  vpc_id            = aws_vpc.ladsoft_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}_${each.key}"
  }
}

resource "aws_route_table" "ladsoft_pub_RT" {
    vpc_id = aws_vpc.ladsoft_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.ladsoft_vpc_igw.id
              
    }
    tags = {
        Name = "${var.vpc_name}_public-RT"
        
    }

}

# #########soubnet-route-table-association ##########
resource "aws_route_table_association" "ladsoft_pub_RT_assoc" {
    for_each = var.public_subnets
    subnet_id = aws_subnet.ladsoft_public_subnets[each.key].id
    route_table_id = aws_route_table.ladsoft_pub_RT.id
}


# resource "aws_route_table" "ladsoft_pvt_RT" {
#     vpc_id = aws_vpc.ladsoft_vpc.id
    
#     tags = {
#         Name = "${var.vpc_name}_private-RT"
        
#     }

# }
# #### using for_each to associate route table with subnet ######



# resource "aws_route_table_association" "ladsoft_pvt_RT_assoc" {
#     for_each = toset(var.private_subnet_cidrs)
#     subnet_id      = aws_subnet.ladsoft_private_subnet[each.key].id
#     route_table_id = aws_route_table.ladsoft_pvt_RT.id
# }

# # resource "aws_route_table_association" "ladsoft_pub_RT_assoc" {
# #      count =  length(var.public_subnet_cidrs)
# #      subnet_id = aws_subnet.ladsoft_public_subnet[count.index].id
# #      route_table_id = aws_route_table.ladsoft_pub_RT.id
# #       }

# #       resource "aws_route_table_association" "ladsoft_pvt_RT_assoc" {
# #      count =  length(var.private_subnet_cidrs)
# #      subnet_id = aws_subnet.ladsoft_private_subnet[count.index].id
# #      route_table_id = aws_route_table.ladsoft_pvt_RT.id
# #       }


# resource "aws_subnet" "private_subnets" {
#   for_each = var.private_subnets
#   vpc_id            = aws_vpc.ladsoft_vpc.id
#   cidr_block        = each.value.cidr
#   availability_zone = each.value.az
#   tags = {
#     Name = "${var.vpc_name}_${each.key}"
#   }
# }
