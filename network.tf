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

resource "aws_security_group" "dev-sec-group" {
  vpc_id = aws_vpc.dev-vpc.id

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = var.app_port
    to_port = var.app_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "dev-app-sec-group"
  }
}