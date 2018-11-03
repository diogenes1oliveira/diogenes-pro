terraform {
  backend "s3" {
    encrypt = true
    bucket = "terraform-diogenes-pro-state-bucket"
    key = "terraform-state"
    dynamodb_table = "terraform-diogenes-pro-state-lock-table"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "${var.region}"
}
