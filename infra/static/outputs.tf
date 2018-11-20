output "static-files-bucket" {
  value = "${aws_s3_bucket.static-files-bucket.id}"
}

output "static-files-endpoint" {
  value = "${aws_s3_bucket.static-files-bucket.website_endpoint}"
}
