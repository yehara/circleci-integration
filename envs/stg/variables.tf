variable "name" {
  default = "stg-yehara-terraform"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  default = "10.2.0.0/16"
}

variable "instance_types" {
  default = {
    "web" = "t2.nano"
    "app" = "t2.nano"
  }
}

variable "amazon_linux_ami" {
  default = "ami-482a562f"
}

