resource "aws_subnet" "dev-public-subnet-1" {
  vpc_id = aws_vpc.dev-vpc.id
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.az1
  tags = {
    Name = "dev-public-subnet-1"
  }
}

resource "aws_subnet" "dev-private-subnet-1" {
  vpc_id = aws_vpc.dev-vpc.id
  cidr_block = "10.10.2.0/24"
  availability_zone = var.az1
  tags = {
    Name = "dev-private-subnet-1"
  }
}

resource "aws_subnet" "dev-private-subnet-2" {
  vpc_id = aws_vpc.dev-vpc.id
  cidr_block = "10.10.3.0/24"
  availability_zone = var.az2
  tags = {
    Name = "dev-private-subnet-2"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name = "dev-db-subnet_group"
  subnet_ids = [aws_subnet.dev-private-subnet-1.id, aws_subnet.dev-private-subnet-2.id]
}
