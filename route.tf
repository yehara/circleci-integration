resource "aws_main_route_table_association" "main" {
    vpc_id = "${aws_vpc.vpc1.id}"
    route_table_id = "${aws_route_table.main.id}"
}

resource "aws_route_table" "main" {
    vpc_id = "${aws_vpc.vpc1.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}
 
resource "aws_route_table_association" "main" {
    count = 2
    subnet_id = "${element(aws_subnet.vpc1-subnet.*.id, count.index)}"
    route_table_id = "${aws_route_table.main.id}"
}

