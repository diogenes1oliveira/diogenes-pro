resource "aws_security_group" "default-sg" {
  name = "default-sg-${var.project-name}"
  vpc_id = "${aws_vpc.vpc-main.id}"
  revoke_rules_on_delete = true

  tags {
    Name = "default-sg-${var.project-name}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Default security group for the project ${var.project-name}"
  }
}

resource "aws_security_group_rule" "vpc-icmp-traffic-outbound" {
  security_group_id = "${aws_security_group.default-sg.id}"
  description = "All outbound ICMP traffic"

  type = "egress"
  from_port = -1
  to_port = -1
  protocol = "icmp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "vpc-icmp-traffic-inbound" {
  count = "${length(var.allowed-vpc-inbound-icmp-traffic)}"
  security_group_id = "${aws_security_group.default-sg.id}"
  description = "${lookup(var.allowed-vpc-inbound-icmp-traffic[count.index], "description")}"

  type = "ingress"
  from_port = "${lookup(var.allowed-vpc-inbound-icmp-traffic[count.index], "type")}"
  to_port = "${lookup(var.allowed-vpc-inbound-icmp-traffic[count.index], "code")}"
  protocol = "icmp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "vpc-http-outbound-traffic" {
  security_group_id = "${aws_security_group.default-sg.id}"
  description = "Outbound HTTP traffic"

  type = "egress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "vpc-https-outbound-traffic" {
  security_group_id = "${aws_security_group.default-sg.id}"
  description = "Outbound HTTPS traffic"

  type = "egress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
