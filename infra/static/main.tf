provider "aws" {
  region = "${var.region}"
}


resource "aws_s3_bucket" "access-log" {
  bucket_prefix = "tf-access-log-${var.static-prefix}.${var.domain}-"
  acl = "log-delivery-write"
  region = "${var.region}"

  lifecycle {
    create_before_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags {
    Name = "tf-access-log-${var.static-prefix}.${var.domain}"
    Category = "frontend"
    Project = "${var.project-name}"
    Description = "${var.project-name} - access log for the static files"
  }
}

resource "aws_s3_bucket" "static-files-bucket" {
  bucket = "${var.static-prefix}.${var.domain}"
  acl = "public-read"
  region = "${var.region}"

  lifecycle {
    create_before_destroy = true
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.access-log.id}"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["https://diogenes.pro", "https://*.diogenes.pro"]
    expose_headers = ["ETag"]
  }

  tags {
    Name = "${var.static-prefix}.${var.domain}"
    Category = "frontend"
    Project = "${var.project-name}"
    Description = "${var.project-name} - static files"
  }

}

data "template_file" "policy-main" {
  template = "${file("${path.module}/policy-main.json")}"

  vars {
    bucket = "${aws_s3_bucket.static-files-bucket.id}"
  }
}

resource "aws_s3_bucket_policy" "static-files-policy" {
  bucket = "${aws_s3_bucket.static-files-bucket.id}"
  policy = "${data.template_file.policy-main.rendered}"
}
