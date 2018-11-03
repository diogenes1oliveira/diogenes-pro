
provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "state_bucket" {
  bucket = "terraform-state-${var.project_name}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "state_bucket"
    Category = "backend"
    Description = "${var.project_name} - Terraform state"
  }
}

resource "aws_dynamodb_table" "state_lock_table" {
  name = "terraform-state-lock-${var.project_name}"
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
    Name = "state_lock_table"
    Category = "backend"
    Description = "${var.project_name} - Terraform state lock"
  }
}
