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
  region = "${var.region}"
  vpc-nats = 0
  bastion-hosts = 0
  create-ssm-endpoints = false
}


module "static" {
  source = "./static"

  project-name = "diogenes-pro"
  region = "${var.region}"
  domain = "diogenes.pro"
  static-prefix = "static"
}

module "cdn" {
  source = "./cdn"

  domain = "diogenes.pro"
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
  zone-id = "${var.cloudflare_zone_id}"
  static-prefix = "static"
  static-destination-domain = "${module.static.static-files-endpoint}"
}
