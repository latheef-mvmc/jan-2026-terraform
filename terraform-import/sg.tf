resource "aws_security_group" "import_sg" {
    name        = "import_sg"
    description = "Security group for import_kops instance"
    vpc_id      = aws_vpc.import_vpc.id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port   = 0 
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_security_group" "prod_sg" {
    name        = "prod_sg"
    description = "Security group for prod_kops instance"
    vpc_id      = aws_vpc.import_vpc.id
    tags = {
        Name = "prod_sg"
    }
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.0.2.0/24"]
    }
    
    
}



#terraform import aws_security_group.import_sg sg-04ddaa1a68cb6540f