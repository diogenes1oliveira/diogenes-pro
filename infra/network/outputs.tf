output "vpc-main" {
  value = "${aws_vpc.vpc-main.id}"
}

output "public-subnets" {
  value = {
    ids = "${aws_subnet.public-subnets.*.id}"
    names = "${aws_subnet.public-subnets.*.tags.Name}"
    azs = "${aws_subnet.public-subnets.*.availability_zone}"
    cidr-blocks = "${aws_subnet.public-subnets.*.cidr_block}"
    ipv6-cidr-blocks = "${aws_subnet.public-subnets.*.ipv6_cidr_block}"
  }
}

output "private-subnets" {
  value = {
    ids = "${aws_subnet.private-subnets.*.id}"
    names = "${aws_subnet.private-subnets.*.tags.Name}"
    azs = "${aws_subnet.private-subnets.*.availability_zone}"
    cidr-blocks = "${aws_subnet.private-subnets.*.cidr_block}"
    ipv6-cidr-blocks = "${aws_subnet.private-subnets.*.ipv6_cidr_block}"
  }
}

output "default-sg" {
  value = "${aws_security_group.default-sg.id}"
}
