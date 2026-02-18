resource "aws_instance" "pub_instace" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.public_subnet_id
    vpc_security_group_ids = [var.security_group_id]
    associate_public_ip_address = true
    key_name = var.key_name

  tags = {
    Name = "${var.vpc_name}-public-instance"
}
}