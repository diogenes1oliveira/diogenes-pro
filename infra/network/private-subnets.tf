
resource "aws_subnet" "private-subnets" {
  count = "${length(var.vpc-private-subnets)}"

  vpc_id = "${aws_vpc.vpc-main.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc-main.cidr_block, 4, 15 - count.index)}"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.vpc-main.ipv6_cidr_block, 8, 255 - count.index)}"
  availability_zone ="${lookup(var.vpc-private-subnets[count.index], "az")}"

  map_public_ip_on_launch = false
  assign_ipv6_address_on_creation = false

  tags {
    Name = "${lookup(var.vpc-private-subnets[count.index], "name")}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Private subnet in the ${lookup(var.vpc-private-subnets[count.index], "az")} AZ for the project ${var.project-name}"
  }
}

resource "aws_route_table" "private-subnets-route-tables" {
  count = "${length(var.vpc-private-subnets)}"
  vpc_id = "${aws_vpc.vpc-main.id}"

  tags {
    Name = "route-table-${lookup(var.vpc-private-subnets[count.index], "name")}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Route table for the private subnet ${lookup(var.vpc-private-subnets[count.index], "name")} in the ${lookup(var.vpc-private-subnets[count.index], "az")} AZ for the project ${var.project-name}"
  }
}

resource "aws_route_table_association" "private-subnet-route-table-associations" {
  count = "${length(var.vpc-private-subnets)}"

  subnet_id = "${element(aws_subnet.private-subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private-subnets-route-tables.*.id, count.index)}"
}

resource "aws_route" "private-subnets-ipv6-route-to-egress-only-ig" {
  count = "${length(var.vpc-private-subnets)}"

  route_table_id = "${element(aws_route_table.private-subnets-route-tables.*.id, count.index)}"
  egress_only_gateway_id = "${aws_egress_only_internet_gateway.vpc-main-egress-only-ig.id}"
  destination_ipv6_cidr_block = "::/0"
}

resource "aws_eip" "nat-eips" {
  count = "${var.vpc-nats}"
  depends_on = ["aws_internet_gateway.vpc-main-ig"]

  tags {
    Name = "eip-${lookup(var.vpc-private-subnets[count.index], "name")}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Elastic IP for the private subnet ${lookup(var.vpc-private-subnets[count.index], "name")} in the ${lookup(var.vpc-private-subnets[count.index], "az")} AZ for the project ${var.project-name}"
  }
}

resource "aws_nat_gateway" "nat-gateways" {
  count = "${var.vpc-nats}"
  depends_on = ["aws_internet_gateway.vpc-main-ig"]

  subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
  allocation_id = "${element(aws_eip.nat-eips.*.id, count.index)}"

  tags {
    Name = "eip-${lookup(var.vpc-private-subnets[count.index], "name")}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Elastic IP for the private subnet ${lookup(var.vpc-private-subnets[count.index], "name")} in the ${lookup(var.vpc-private-subnets[count.index], "az")} AZ for the project ${var.project-name}"
  }
}

resource "aws_route" "private-subnets-route-to-nat-gateway" {
  count = "${var.vpc-nats}"

  route_table_id = "${element(aws_route_table.private-subnets-route-tables.*.id, count.index)}"
  nat_gateway_id = "${element(aws_nat_gateway.nat-gateways.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
}
