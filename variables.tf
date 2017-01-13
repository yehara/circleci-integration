variable "name" {}
variable "vpc_cidr" {}
variable "instance_types" {
  type = "map"
}
variable "azs" {
  type = "list"
}

