variable "vpc_name" {
  type = string
}
variable "vpc_id" {
  type = string
}
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