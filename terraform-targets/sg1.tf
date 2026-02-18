resource "aws_security_group" "demo" {
  vpc_id = aws_vpc.august_batch_vpc.id

  ingress  {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   
  }
  tags = {
    name = "demo-sg"
  }
}