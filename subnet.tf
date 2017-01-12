resource "aws_subnet" "vpc1-subnet1" {
    vpc_id                  = "${aws_vpc.saas-oregon-production.id}"
    cidr_block              = "10.20.0.0/16"
    availability_zone       = "us-west-2a"
    map_public_ip_on_launch = true

    tags {
        "Name" = "a-public"
    }
}

