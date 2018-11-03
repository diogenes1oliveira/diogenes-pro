
provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "state-bucket" {
  bucket = "terraform-state-${var.project-name}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "state-bucket"
    Category = "backend"
    Description = "${var.project-name} - Terraform state"
  }
}

resource "aws_dynamodb_table" "state-lock-table" {
  name = "terraform-state-lock-${var.project-name}"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

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
    Description = "${var.project-name} - Terraform state lock"
  }
}
