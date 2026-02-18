output "public_instance_Public_ip" {
  value = aws_instance.pub1_instance.public_ip
  
}
output "public_instance_id_private_ip" {
  value = aws_instance.pub1_instance.private_ip
  
}
output "vpc_id" {
  value = aws_vpc.ladsoft_vpc.id
}