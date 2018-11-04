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

variable "allowed-vpc-inbound-icmp-traffic" {
  description = "Allowed inbound ICMP traffic in the VPC"
  default = [
    {
      description = "Echo Request (IPv4)"
      type = 8
      code = 0
    },
    {
      description = "Echo Reply (IPv4)"
      type = 0
      code = 0
    },
    {
      description = "Echo Request (IPv6)"
      type = 128
      code = 0
    },
    {
      description = "Echo Reply (IPv6)"
      type = 129
      code = 0
    },
    {
      description = "Fragmentation Required (IPv4)"
      type = 3
      code = 4
    },
    {
      description = "Packet Too Big (IPv6)"
      type = 2
      code = 0
    },
    {
      description = "Time Exceeded (IPv4)"
      type = 11
      code = 0
    },
    {
      description = "Time Exceeded (IPv6)"
      type = 3
      code = 0
    }
  ]
}