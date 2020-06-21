variable "aws_region" {
  default = "us-east-2"
}

variable "az1" {
  default = "us-east-2a"
}

variable "az2" {
  default = "us-east-2b"
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