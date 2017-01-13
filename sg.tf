resource "aws_security_group" "vpc-default" {
    name        = "default-sg"
    description = "default VPC security group"
    vpc_id      = "${aws_vpc.vpc1.id}"
}

resource "aws_security_group_rule" "allow-self" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = "${aws_security_group.vpc-default.id}"
    self = true
}

resource "aws_security_group_rule" "allow-http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.vpc-default.id}"
}

resource "aws_security_group_rule" "allow-ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.vpc-default.id}"
}

resource "aws_security_group_rule" "allow-all" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.vpc-default.id}"
}

