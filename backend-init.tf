
variable "project_name" {
  description = "Name of the project" # (!)
  default = "diogenes-pro"
}

variable "environments" {
  description = "List of the separate environments in the stack"
  default = ["development", "production"]
}

provider "aws" {
  region = "us-east-2" # Ohio
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-${var.project_name}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Description = "${var.project_name} - Terraform state"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  count = "${length(var.environments)}"
  name = "terraform-state-lock-${var.project_name}-${element(var.environments, count.index)}"
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
    Description = "${var.project_name} - Terraform state lock for the ${element(var.environments, count.index)} environment"
  }
}
