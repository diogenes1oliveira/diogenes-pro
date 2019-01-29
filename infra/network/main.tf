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

resource "aws_egress_only_internet_gateway" "vpc-main-egress-only-ig" {
  vpc_id = "${aws_vpc.vpc-main.id}"
}

resource "aws_route53_zone" "vpc-private-zone" {
  count = "${var.create-private-zone ? 1 : 0}"
  name = "example.com"

  vpc {
    vpc_id = "${aws_vpc.vpc-main.id}"
  }

}