provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "vpc-main" {
  cidr_block = "${var.vpc-cidr-block}"
  enable_dns_support = true
  enable_dns_hostnames = true
  assign_generated_ipv6_cidr_block = true

  tags {
    Name = "vpc-main"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Main VPC for the project ${var.project-name}"
  }
}

resource "aws_internet_gateway" "vpc-main-ig" {
  vpc_id = "${aws_vpc.vpc-main.id}"

  tags {
    Name = "vpc-main-ig"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Internet gateway for the project ${var.project-name}"
  }
}

resource "aws_subnet" "public-subnets" {
  count = "${length(var.vpc-public-subnets)}"

  vpc_id = "${aws_vpc.vpc-main.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc-main.cidr_block, 4, count.index + 1)}"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.vpc-main.ipv6_cidr_block, 8, count.index + 1)}"
  availability_zone ="${lookup(var.vpc-public-subnets[count.index], "az")}"

  map_public_ip_on_launch = true
  assign_ipv6_address_on_creation = true

  tags {
    Name = "${lookup(var.vpc-public-subnets[count.index], "name")}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Public subnet in the ${lookup(var.vpc-public-subnets[count.index], "az")} AZ for the project ${var.project-name}"
  }
}

resource "aws_route_table" "public-subnets-route-tables" {
  count = "${length(var.vpc-public-subnets)}"
  vpc_id = "${aws_vpc.vpc-main.id}"

  tags {
    Name = "route-table-${lookup(var.vpc-public-subnets[count.index], "name")}"
    Category = "network"
    Project = "${var.project-name}"
    Description = "Route table for the public subnet ${lookup(var.vpc-public-subnets[count.index], "name")} in the ${lookup(var.vpc-public-subnets[count.index], "az")} AZ for the project ${var.project-name}"
  }
}

resource "aws_route_table_association" "public-subnet-route-table-associations" {
  count = "${length(var.vpc-public-subnets)}"

  subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public-subnets-route-tables.*.id, count.index)}"
}
