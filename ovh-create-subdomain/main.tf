# Add a record to a sub-domain
resource "ovh_domain_zone_record" "pointer_A" {
  zone      = "example.com"
  subdomain = "PTR_A"
  fieldtype = "A"
  ttl       = 3600
  target    = "127.0.0.1"
}

resource "ovh_domain_zone_record" "pointer_CNAME" {
  zone      = "example.com"
  subdomain = "PTR_CNAME"
  fieldtype = "CNAME"
  ttl       = 3600
  target    = "my-a.example.com."
}