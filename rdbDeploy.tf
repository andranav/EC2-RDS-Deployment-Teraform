resource "aws_db_instance" "db_instance" {
  multi_az = false
  engine = var.db_engine
  engine_version = var.db_engine_version
  port = var.db_port
  instance_class = var.rds_instance_type
  allocated_storage = var.db_storage
  username = var.db_username
  password = var.db_password
  publicly_accessible = true
  name = var.db_name
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.dev-db-sec-group.id]
  depends_on = [aws_security_group.dev-db-sec-group]
}