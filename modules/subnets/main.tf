resource "aws_subnet" "subnet_us_east_1a" {
    vpc_id     = var.vpc.id
    cidr_block = cidrsubnet(var.vpc.cidr_block, 8, 0)
    availability_zone = "us-east-1a"
    tags = {
        Name = "pub-1"
    }
}

resource "aws_subnet" "subnet_us_east_1b" {
    vpc_id     = var.vpc.id
    cidr_block = cidrsubnet(var.vpc.cidr_block, 8, 1)
    availability_zone = "us-east-1b"

    tags = {
        Name = "pub-2"
    }
}