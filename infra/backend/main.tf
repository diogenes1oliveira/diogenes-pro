provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "state-bucket" {
  bucket = "${var.state-bucket}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "${var.state-bucket}"
    Category = "backend"
    Project = "${var.project-name}"
    Description = "${var.project-name} - Terraform state"
  }
}

resource "aws_dynamodb_table" "state-lock-table" {
  name = "${var.state-lock-table}"
  hash_key = "LockID"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "state-lock-table"
    Category = "backend"
    Project = "${var.project-name}"
    Description = "${var.project-name} - Terraform state lock"
  }
}
