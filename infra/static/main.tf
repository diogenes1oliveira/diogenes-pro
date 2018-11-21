provider "aws" {
  region = "${var.region}"
}

data "template_file" "policy-main" {
  template = "${file("${path.module}/policy-main.json")}"

  vars {
    domain = "${var.domain}"
  }
}

resource "aws_s3_bucket" "access-log" {
  bucket_prefix = "tf-access-log-${var.domain}-"
  acl = "log-delivery-write"
  region = "${var.region}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "Access-Log-${var.domain}"
    Category = "frontend"
    Project = "${var.project-name}"
    Description = "${var.project-name} - access log for the static files"
  }
}

resource "aws_s3_bucket" "static-files-bucket" {
  bucket_prefix = "tf-${var.domain}-"
  acl = "public-read"
  policy = "${data.template_file.policy-main.rendered}"
  region = "${var.region}"

  lifecycle {
    create_before_destroy = true
  }

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.access-log.id}"
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["https://*.diogenes.pro"]
    expose_headers = ["ETag"]
  }

  tags {
    Name = "${var.domain}"
    Category = "frontend"
    Project = "${var.project-name}"
    Description = "${var.project-name} - static files"
  }

}
