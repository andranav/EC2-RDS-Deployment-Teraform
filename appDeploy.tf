resource "aws_instance" "app" {
  ami = var.ami
  instance_type = var.ec2_inst_type
  subnet_id = aws_subnet.dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.dev-sec-group.id]
  key_name = aws_key_pair.dev-key-pair.id
}

resource "aws_key_pair" "dev-key-pair" {
  key_name = "dev-key-pair"
  public_key = file(var.public_key_path)
}