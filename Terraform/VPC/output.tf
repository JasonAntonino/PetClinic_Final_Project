output "vpc_id" {
  value = aws_vpc.our_vpc.id
}
output "route_table_id" {
  value = aws_route_table.public.id
}
output "pri_route_table_id" {
  value = aws_route_table.private.id
}
output "internet_gate" {
  value = aws_internet_gateway.gw
}