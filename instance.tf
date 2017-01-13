resource "aws_instance" "web1" {

    ami                         = "${var.amazon_linux_ami}"
    availability_zone           = "${var.azs[0]}"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "mijs-key"
    subnet_id                   = "${aws_subnet.vpc1-subnet.0.id}"
    vpc_security_group_ids      = ["${aws_security_group.vpc-default.id}"]
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        iops                  = 100
        delete_on_termination = true
    }

    tags {
        "Name" = "web1"
    }
}

resource "aws_instance" "web2" {

    ami                         = "${var.amazon_linux_ami}"
    availability_zone           = "${var.azs[1]}"
    ebs_optimized               = false
    instance_type               = "t2.nano"
    monitoring                  = false
    key_name                    = "mijs-key"
    subnet_id                   = "${aws_subnet.vpc1-subnet.1.id}"
    vpc_security_group_ids      = ["${aws_security_group.vpc-default.id}"]
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        iops                  = 100
        delete_on_termination = true
    }

    tags {
        "Name" = "web2"
    }
}


