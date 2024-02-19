resource "aws_subnet" "my-subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr_blocks
  availability_zone = "us-east-1a"
}
