provider "aws" {
  region = "${var.region}"
}

data "template_file" "bucket-policy" {
  template = "${file("policy.json")}"

  vars {
    domain = "${var.domain}"
  }
}

resource "aws_s3_bucket" "access-log" {
  bucket = "access-log-${var.domain}"
  acl = "private"
  region = "${var.region}"

  tags {
    Name = "Access-Log-${var.domain}"
    Category = "frontend"
    Project = "${var.project-name}"
    Description = "${var.project-name} - access log for the static files"
  }
}

resource "aws_s3_bucket" "static-files-bucket" {
  bucket = "${var.domain}"
  acl = "public-read"
  policy = "${data.template_file.bucket-policy.rendered}"
  region = "${var.region}"

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
