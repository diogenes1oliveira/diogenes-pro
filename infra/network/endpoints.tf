resource "aws_vpc_endpoint" "s3-endpoint" {
  vpc_id = "${aws_vpc.vpc-main.id}"
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = ["${concat(aws_route_table.public-subnets-route-tables.*.id, aws_route_table.private-subnets-route-tables.*.id)}"]
}
