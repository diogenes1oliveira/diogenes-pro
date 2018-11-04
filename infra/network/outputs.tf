output "vpc-id" {
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