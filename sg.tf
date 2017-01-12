resource "aws_security_group" "vpc-default" {
    name        = "default"
    description = "default VPC security group"
    vpc_id      = "${aws_vpc.saas-oregon-production.id}"
}

resource "aws_security_group_rule" "allow-self" {
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = "${aws_security_group.vpc-default.id}"
    self = true
}

resource "aws_security_group_rule" "allow-monitoring-tcp" {
    type = "ingress"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks     = ["218.251.62.90/32", "54.169.117.225/32", "54.187.77.114/32"]
    security_group_id = "${aws_security_group.vpc-default.id}"
}

resource "aws_security_group_rule" "allow-monitoring-icmp" {
    type = "ingress"
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks     = ["218.251.62.90/32", "54.169.117.225/32", "54.187.77.114/32"]
    security_group_id = "${aws_security_group.vpc-default.id}"
}

resource "aws_security_group_rule" "allow-ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks     = ["54.199.205.8/32"]
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

