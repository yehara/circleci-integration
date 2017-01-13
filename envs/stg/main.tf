provider "aws" {
  region = "${var.region}"
}

module "stg" {
  source = "../../"

  name                = "${var.name}"
  vpc_cidr            = "${var.vpc_cidr}"
  instance_types      = "${var.instance_types}"
  azs                 = ["ap-northeast-1b", "ap-northeast-1c"]
  amazon_linux_ami    = "${var.amazon_linux_ami}"
  keypair_name        = "key-${var.name}"
}

