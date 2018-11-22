provider "cloudflare" {
  email = "${var.email}"
  token = "${var.token}"
}

resource "cloudflare_record" "static-record" {
  domain = "${var.domain}"
  name = "${var.static-prefix}"
  value = "${var.static-destination-domain}"
  type = "CNAME"
  proxied = true
  ttl = "1"
}
