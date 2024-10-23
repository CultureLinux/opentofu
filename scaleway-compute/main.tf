
provider "scaleway" {
  zone   = var.scaleway_config.zone
  region = var.scaleway_config.region
}

resource "scaleway_instance_ip" "public_ip" {
  project_id = var.scaleway_config.project_id
}
resource "scaleway_instance_ip" "public_ip_backup" {
  project_id = var.scaleway_config.project_id
}

resource "scaleway_instance_security_group" "www" {
  project_id              = var.scaleway_config.project_id
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action   = "accept"
    port     = "22"
    ip_range = "0.0.0.0/0"
  }
}

resource "scaleway_instance_server" "web" {
  project_id = var.scaleway_config.project_id
  type       = var.scaleway_config.type
  image      = var.scaleway_config.image

  tags = ["test", "opentofu"]

  ip_id = scaleway_instance_ip.public_ip.id

}

output "instance_ips" {
  value = scaleway_instance_ip.public_ip.address
}