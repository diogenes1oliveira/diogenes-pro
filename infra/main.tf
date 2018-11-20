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

module "network" {
  source = "./network"

  project-name = "diogenes-pro"
  region = "us-east-2"
  vpc-nats = 0
  bastion-hosts = 0
}


module "static" {
  source = "./static"

  project-name = "diogenes-pro"
  region = "us-east-2"
  domain = "static.diogenes.pro"
}
