output "cidr_vpc_id" {
  value = {
    cidr = aws_vpc.vpc_us_east_1.cidr_block
    id = aws_vpc.vpc_us_east_1.id
  }
}
