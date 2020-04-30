output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnets.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnets.private.id
}

output "public_table_id" {
  value = aws_route_table.public_table.id
}

output "private_table_id" {
  value = aws_route_table.private_table.id
}

