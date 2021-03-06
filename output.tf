output "web1-address" {
  value = "${aws_instance.web1.public_dns}"
}
 
output "web2-address" {
  value = "${aws_instance.web2.public_dns}"
}
 
output "web-elb-address" {
  value = "${aws_elb.web-elb.dns_name}"
}

