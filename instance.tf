resource "aws_instance" "web1" {

    ami                         = "ami-9f0c67f8"
    availability_zone           = "ap-northeast-1b"
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


