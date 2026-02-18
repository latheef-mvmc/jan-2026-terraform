output "route_table_id" {
  value = aws_route_table.Ladsoft_pubrt.id
}
output "private_route_table_id" {
  value = aws_route_table.Ladsoft_privrt.id
}