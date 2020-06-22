resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.10.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  instance_tenancy = "default"
  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name = "dev-igw"
  }
}