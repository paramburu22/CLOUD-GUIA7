resource "aws_vpc" "vpc_us_east_1" {
    cidr_block = var.vpc_cidr
}


module "subnets" {
  source = "./modules/subnets"
  vpc = {
    id = aws_vpc.vpc_us_east_1.id
    cidr_block = aws_vpc.vpc_us_east_1.cidr_block
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_us_east_1.id

  tags = {
    Name = "vpc_ig"
  }
}

resource "aws_route_table" "subnets_to_igw" {
  vpc_id = aws_vpc.vpc_us_east_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route table"
  }
}

resource "aws_route_table_association" "subnet_us_east_1a" {
  subnet_id      = module.subnets.subnets_id["subnet1"]
  route_table_id = aws_route_table.subnets_to_igw.id
}

resource "aws_route_table_association" "subnet_us_east_1b" {
  subnet_id      = module.subnets.subnets_id["subnet2"]
  route_table_id = aws_route_table.subnets_to_igw.id
}