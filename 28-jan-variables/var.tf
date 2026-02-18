variable "region" {
  description = "AWS region"
  type        = string
 }
variable "access_key" {
  description = "AWS access key"
  type        = string
}
variable "secret_key" {
  description = "AWS secret key"
  type        = string
  default     = ""
}
############# vpc-variables #############
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
 }
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
 }
###### subnet-variables ##########
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
 }
variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
 }
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
 }
variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
 }   
variable "az_zone1" {
  type = string
 
}
variable "az_zone2" {
  type = string
 }
 variable "env" {
   type = string
 }