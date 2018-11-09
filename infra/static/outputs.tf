output "static-files-bucket" {
  value = "${aws_s3_bucket.static-files-bucket.id}"
}
