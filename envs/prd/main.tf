provider "aws" {
  region = "${var.region}"
}

module "prd" {
  source = "../../"

  name                = "${var.name}"
  vpc_cidr            = "${var.vpc_cidr}"
  instance_types      = "${var.instance_types}"
  azs                 = "${data.aws_availability_zones.az.names}"
}

