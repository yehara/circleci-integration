provider "aws" {
  region = "${var.region}"
}

module "prd" {
  source = "../../"

  name                = "${var.name}"
  vpc_cidr            = "${var.vpc_cidr}"
  instance_types      = "${var.instance_types}"
  azs                 = ["ap-northeast-1b", "ap-northeast-1c"]
}

