resource "aws_instance" "app" {
  ami = var.ami
  instance_type = var.ec2_inst_type
  subnet_id = aws_subnet.dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.dev-app-sec-group.id]
  key_name = aws_key_pair.dev-key-pair.id
  depends_on = [aws_internet_gateway.dev-igw]
  user_data = data.template_file.app_bootstrap.rendered
}

data "template_file" "app_bootstrap" {
  template = file("./bootstrap.sh")
  vars = {
    db_username = var.db_username
    db_password = var.db_password
    db_name = var.db_name
    db_endpoint = aws_db_instance.db_instance.address
  }
}

output "app_endpoint" {
  value = aws_instance.app.public_ip
}

resource "aws_key_pair" "dev-key-pair" {
  key_name = "dev-key-pair"
  public_key = file(var.public_key_path)
}
