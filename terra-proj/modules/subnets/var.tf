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

variable "vpc_id" {
  description = "The ID of the VPC"
  type = string
}
variable "az1" {
  type = string

}
variable "az2" {
  type = string
}
  