output "public_subnet_id" {
    value = aws_subnet.pub_subnet.id
             #provider_resouce.resourceblock.id
  }
  
output "private_subnet_id" {
    value = aws_subnet.priv_subnet.id
  }
  