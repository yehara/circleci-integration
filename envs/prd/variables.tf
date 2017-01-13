variable "name" {
  default = "prd-yehara-terraform"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "instance_types" {
  default = {
    "web" = "t2.nano"
    "app"     = "t2.nano"
  }
}

data "aws_availability_zones" "az" {}


