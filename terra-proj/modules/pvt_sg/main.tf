resource "aws_security_group" "Pvt_ladsoft_sg" {
    name = "${var.vpc_name}-pvt_sg"
    description = "Security group for ${var.vpc_name}"
    vpc_id = var.vpc_id

    ingress {
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = var.protocol
        cidr_blocks = [var.pvt_sg_cidr]
    }

ingress {
        from_port = var.icmp_from_port
        to_port = var.icmp_to_port
        protocol = var.protocol_name
        cidr_blocks = [var.pvt_sg_cidr]
    }
    egress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.egress_protocol
        cidr_blocks = [var.pvt_sg_cidr]
    }

    tags = {
        Name = "${var.vpc_name}-pvt_sg"
    }
}