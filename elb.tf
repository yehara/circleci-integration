resource "aws_elb" "web-elb" {
  name = "web-elb-${var.name}"
  subnets = [
    "${aws_subnet.vpc1-subnet.0.id}",
    "${aws_subnet.vpc1-subnet.1.id}",
  ]
  security_groups = [
    "${aws_security_group.vpc-default.id}",
  ]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    target = "HTTP:80/"
    interval = 30
  }
  instances = ["${aws_instance.web1.id}", "${aws_instance.web2.id}"]
  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "web-elb-${var.name}"
  }
}

