resource "aws_main_route_table_association" "main" {
    vpc_id = "${aws_vpc.vpc1.id}"
    route_table_id = "${aws_route_table.main.id}"
}

resource "aws_route" "main" {
    route_table_id = "${aws_route_table.main.id}"
    destination_cidr_block = "0.0.0.0/0"
    depends_on = ["aws_route_table.main"]
}

resource "aws_route_table" "main" {
    vpc_id = "${aws_vpc.vpc1.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}
 
resource "aws_route_table_association" "main" {
    subnet_id = "${aws_subnet.saas-oregon-production-a-public.id}"
    route_table_id = "${aws_route_table.main.id}"
}

