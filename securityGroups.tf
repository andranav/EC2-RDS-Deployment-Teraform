resource "aws_security_group" "dev-app-sec-group" {
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
    Name = "dev-sec-group"
  }
}

resource "aws_security_group" "dev-db-sec-group" {
  vpc_id = aws_vpc.dev-vpc.id

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = var.db_port
    to_port = var.db_port
    protocol = "tcp"
    security_groups = [aws_security_group.dev-app-sec-group.id]
  }
  tags = {
    Name = "dev-db-sec-group"
  }
}