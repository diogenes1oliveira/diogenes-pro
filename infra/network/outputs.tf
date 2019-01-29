output "vpc-main" {
  value = "${aws_vpc.vpc-main.id}"
}

output "vpc-cidr-block" {
  value = "${aws_vpc.vpc-main.cidr_block}"
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

output "bastion-sg" {
  value = "${aws_security_group.bastion-sg.id}"
}

output "bastion-ips" {
  value = ["${aws_instance.bastion-hosts.*.public_ip}"]
}

output "bastion-key-name" {
  value = "${element(concat(aws_key_pair.bastion-key.*.key_name, list("")), 0)}"
}

output "private-zone-id" {
  value = "${element(concat(aws_route53_zone.vpc-private-zone.*.id, list("")), 0)}"
}
