output "subnets_id" {
  value = {
    subnet1 = aws_subnet.subnet_us_east_1a.id
    subnet2 = aws_subnet.subnet_us_east_1b.id
  }
}