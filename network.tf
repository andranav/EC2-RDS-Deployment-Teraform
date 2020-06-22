resource "aws_route_table" "dev-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }
  tags = {
    Name = "dev-rt"
  }
}

resource "aws_route_table_association" "dev-rt-2-subnet"{
  subnet_id = aws_subnet.dev-public-subnet-1.id
  route_table_id = aws_route_table.dev-rt.id
}

