variable "aws_region" {
  default = "us-east-2"
}

variable "ami" {
  default = "ami-0e84e211558a022c0"
}

variable "ec2_inst_type" {
  default = "t2.micro"
}

variable "app_port" {
  default = "5000"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "db_port" {
  default = "3306"
}

variable "rds_instance_type" {
  default = "db.t2.small"
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "8.0.17"
}

variable "db_storage" {
  default = "8"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "Admin123!"
}

variable "db_name" {
  default = "dev_db"
}

variable "app_bootstrapper" {
  default = "./resources/bootstrap.sh"
}