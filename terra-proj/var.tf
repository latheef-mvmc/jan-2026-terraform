###vpc############
variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type = string
}
variable "vpc_name" {
    description = "The name of the VPC"
    type = string

}
######subnet######
variable "Public_subnet_cidr" {
    description = "The CIDR block for the public subnet"
    type = string
}
variable "Private_subnet_cidr" {
  description = "The CIDR block for private subnet"
    type = string
    
}
variable "public_subnet_name" {
    description = "The name of the public subnet"
    type = string
}
variable "private_subnet_name" {
    description = "The name of the private subnet"
    type = string
}
variable "az1" {
  type = string

}
variable "az2" {
  type = string
}
####igw#####
variable "igw_name" {
  description = "The name of the Internet Gateway"
  type = string
}
####Pub-security group#####
variable "ssh_port" {
  type = string
}
variable "protocol" {
  type = string
}
variable "sg_cidr" {
  type = string
}
variable "from_port" {
  type = string
}
variable "to_port" {
  type = string
}
variable "egress_protocol" {
  type = string
}
variable "icmp_from_port" {
  type = string
}
variable "icmp_to_port" {
  type = string
}
variable "protocol_name" {
  type = string
}

####Pvt-security group#####

variable "pvt_sg_cidr" {
  type = string
}

####ec2#####
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}   
