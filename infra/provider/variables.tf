
variable "project-name" {
  default = "diogenes-pro"
}

variable "region" {
  default = "us-east-2" # Ohio
}

variable "state-bucket" {
  default = "terraform-diogenes-pro-state-bucket"
}

variable "state-lock-table" {
  default = "terraform-diogenes-pro-state-lock-table"
}
