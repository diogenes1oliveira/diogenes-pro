provider "aws" {
  region = "us-east-2" # Ohio
}

variable "environments" {
  description = "List of the separate environments in the stack"
  default     = ["development", "production"]
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-diogenes-pro"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Description = "S3 bucket for storing Terraform state"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  count          = "${length(var.environments)}"
  name           = "terraform-state-lock-diogenes-pro-${element(var.environments, count.index)}"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Description = "DynamoDB table for storing the lock for Terraform state for the ${element(var.environments, count.index)} environment"
  }
}
