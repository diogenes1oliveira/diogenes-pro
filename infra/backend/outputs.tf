output "region" {
  value = "${var.region}"
}

output "state_bucket_id" {
  value = "${aws_s3_bucket.state_bucket.id}"
}

output "state_lock_table_id" {
  value = "${aws_dynamodb_table.state_lock_table.id}"
}
