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
