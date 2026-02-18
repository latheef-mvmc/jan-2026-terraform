resource "aws_instance" "pvt_instace" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group_id]
    associate_public_ip_address = false
    key_name = var.key_name

  tags = {
    Name = "${var.vpc_name}-private-instance"
}
}