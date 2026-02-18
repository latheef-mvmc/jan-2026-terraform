resource "aws_security_group" "app_sg" {
  for_each = {
    dev = {
      rules = [
        { 
            port = 22
            protocol = "tcp"
             cidr = "0.0.0.0/0"
              }
        ,
        {
            port = 80
            protocol = "tcp"
            cidr = "0.0.0.0/0" }
        ,
        {
             port = 0
            protocol = "tcp"
             cidr = "0.0.0.0/0"
              }
      ]
    }
    
    qa = {
      rules = [
        { 
            port = 22
            protocol = "tcp"
            cidr = "0.0.0.0/0" }
        ,
        { 
            port = 80
             protocol = "tcp"
            cidr = "0.0.0.0/0"
             }
        ,
        { 
            port = 0
            protocol = "tcp"
            cidr = "0.0.0.0/0" 
            }
      ]
    }
    
    prod = {
      rules = [
        { 
            port = 22
            protocol = "tcp"
             cidr = "0.0.0.0/0"
              },
{ 
            port = 80
             protocol = "tcp"
            cidr = "0.0.0.0/0"
             }

      ]
    }
  }

  name        = "app-sg-${each.key}"
  description = "Security group for ${each.key}"
  vpc_id      = aws_vpc.august_batch_vpc.id

  #################################
  #  Dynamic Ingress
  #################################

  dynamic "ingress" {

    for_each = each.value.rules

    content {
      description = "Allow ${ingress.value.port}"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr]
    }
  }


  #################################

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = each.key
  }
}

