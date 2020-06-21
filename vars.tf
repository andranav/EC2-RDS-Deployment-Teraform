variable "AWSRegion" {
  default = "us-east-2"
}

variable "AZ1" {
  default = "us-east-2a"
}

variable "AMI" {
  default = "ami-0e84e211558a022c0"
}

variable "InstType" {
  default = "t2.micro"
}

variable "appPort" {
  default = "5000"
}

variable "publicKeyPath" {
  default = "~/.ssh/id_rsa.pub"
}