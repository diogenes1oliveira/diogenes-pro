output "public-subnets" {
  value = "${module.network.public-subnets}"
}

output "private-subnets" {
  value = "${module.network.private-subnets}"
}

output "default-sg" {
  value = "${module.network.default-sg}"
}
