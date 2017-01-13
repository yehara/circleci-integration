resource "aws_subnet" "vpc1-subnet" {
    count                   = 2
    vpc_id                  = "${aws_vpc.vpc1.id}"
    cidr_block              = "${cidrsubnet(var.vpc_cidr, 8, count.index+1)}"
    availability_zone       = "${var.azs[count.index]}"
    map_public_ip_on_launch = true

    tags {
        "Name" = "a-public"
    }
}

