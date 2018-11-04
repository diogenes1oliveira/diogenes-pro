variable "region" {
  default = "us-east-2"
}

variable "project-name" {
  type = "string"
}

variable "vpc-cidr-block" {
  description = "CIDR block for the main VPC"
  default = "10.10.0.0/16"
}


variable "vpc-public-subnets" {
  description = "Details of the public subnets"
  default = [
    {
      name = "public-subnet-a"
      az = "us-east-2a"
    },
    {
      name = "public-subnet-b"
      az = "us-east-2b"
    }
  ]
}

variable "vpc-private-subnets" {
  description = "Details of the private subnets"
  default = [
    {
      name = "private-subnet-a"
      az = "us-east-2a"
    },
    {
      name = "private-subnet-b"
      az = "us-east-2b"
    }
  ]
}
