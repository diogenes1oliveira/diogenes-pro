resource "aws_vpc_endpoint" "s3-endpoint" {
  vpc_id = "${aws_vpc.vpc-main.id}"
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = ["${concat(aws_route_table.public-subnets-route-tables.*.id, aws_route_table.private-subnets-route-tables.*.id)}"]
}

variable "ssm-services" {
  default = ["ssm", "ec2messages", "ec2", "ssmmessages"]
}
resource "aws_vpc_endpoint" "interface-endpoints" {
  count = "${length(var.ssm-services)}"

  vpc_id = "${aws_vpc.vpc-main.id}"
  vpc_endpoint_type = "Interface"
  service_name = "com.amazonaws.${var.region}.${element(var.ssm-services, count.index)}"
  subnet_ids = ["${aws_subnet.private-subnets.*.id}"]
  private_dns_enabled = true
  security_group_ids = ["${aws_security_group.endpoint-sg.id}"]
}
