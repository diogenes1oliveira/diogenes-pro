provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "static-files-bucket" {
  bucket = "${var.domain}"
  acl = "public-read"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["https://diogenes.pro"]
    expose_headers = ["ETag"]
  }

  tags {
    Name = "${var.domain}"
    Category = "frontend"
    Project = "${var.project-name}"
    Description = "${var.project-name} - static files"
  }
}
