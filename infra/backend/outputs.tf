output "region" {
  value = "${var.region}"
}

output "state-bucket-id" {
  value = "${aws_s3_bucket.state-bucket.id}"
}

output "state-lock-table-id" {
  value = "${aws_dynamodb_table.state-lock-table.id}"
}
