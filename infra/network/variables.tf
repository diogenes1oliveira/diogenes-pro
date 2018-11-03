variable "region" {
  default = "us-east-2"
}

variable "project-name" {
  type = "string"
}

variable "vpc-cidr-block" {
  description = "CIDR block for the global VPC"
  default = "10.10.0.0/16"
}


variable "vpc-public-subnets" {
  description = "Details of the public subnets"
  default = [
    {
      name = "public-subnet-a"
      az = "us-east-2a"
      cidr = "10.10.32.0/20"
    },
    {
      name = "public-subnet-b"
      az = "us-east-2b"
      cidr = "10.10.96.0/20"
    }
  ]
}

variable "vpc-private-subnets" {
  description = "Details of the private subnets"
  default = [
    {
      name = "private-subnet-a"
      az = "us-east-2a"
      cidr = "10.10.0.0/19"
    },
    {
      name = "private-subnet-b"
      az = "us-east-2b"
      cidr = "10.10.64.0/19"
    }
  ]
}
