variable "region" {
  description = "AWS region"
    default = "ap-south-1"
  type        = string
 }
variable "access_key" {
  description = "AWS access key"
  default = ""
  type        = string
}
variable "secret_key" {
  description = "AWS secret key"
  type        = string
  default     = ""
}
variable "ami_id" {
  default = "ami-0ff5003538b60d5ec"
  type = string
}

variable "instance_type" {
    type = map(string)
    default = {
      dev = "t2.micro"
      prod = "t2.medium "
    }
  }
variable "key_name" {
  description = "Key pair name"
  default = "august"
  type        = string
  }
############# vpc-variables #############
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default =  "60.0.0.0/16" 
    type        = string
 }
variable "vpc_name" {
  description = "Name of the VPC"
    default = "ladsoft_vpc"
  type        = string
 }
###### subnet-variables ##########
# variable "public_subnet_cidrs" {
#   description = "CIDR block for the public subnet"
#   default = [ "60.0.1.0/24", "60.0.2.0/24" ]
#   type        = list(string)
#  }
# variable "public_subnet_name" {
#   description = "Name of the public subnet"
#   type        = string
#  }

 
# variable "private_subnet_cidrs" {
#   description = "CIDR block for the private subnet"
#   default = [ "60.0.3.0/24", "60.0.4.0/24" ]
#   type        = list(string)
#  }
# # variable "private_subnet_name" {
#   description = "Name of the private subnet"
#   type        = string
#  }   

# variable "az_zones" {
#   type = list(string)
#   default = [ "ap-south-1a", "ap-south-1b" ]
 
# }

 variable "env" {
   type = list(string)
    default = [ "Dev", "QA", "Prod" ]
 }
# variable "igw_id" {
#     description = "Internet Gateway ID"
#     type        = string
#     default     = "aws_internet_gateway.ladsoft_vpc_igw.id"
#  }

#  variable "pub_subnet_ids" {
#      description = "Public Subnet IDs"
#     type        = list(string)
#     default     = [ "aws_subnet.ladsoft_public_subnet[*].id" ]
#  }

#   variable "priv_subnet_ids" {
#       description = "Private Subnet IDs"
#       type        = list(string)
#       default     = [ "aws_subnet.ladsoft_private_subnet[*].id" ]
#   }

  #############################
  


  #################################
 variable "public_subnets" {
   type = map(object({
      cidr = string 
      az = string 
      #type = string

    }))
    default = {
      public-1 = {
        cidr = "60.0.1.0/24"
        az = "ap-south-1a"
        #type = "public"
      }
      public-2 = {
        cidr = "60.0.2.0/24"
        az = "ap-south-1b"
        type = "public"
      }
    }
    }

variable "private_subnets" {
  type = map(object({
    cidr = string
    az = string
    type = string
  }))

  default = {
    private-1 = {
      cidr = "60.0.3.0/24"
      az = "ap-south-1a"
      type = "private"
    }
    private-2 = {
        cidr = "60.0.4.0/24"
        az = "ap-south-1b"
        type = "private"
      }
    }
 }


## ladsoft_vpc_private-1