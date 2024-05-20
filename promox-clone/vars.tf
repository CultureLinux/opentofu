variable  "pm_api_url" {
    default =  "https://PROMOX_FQDN:8006/api2/json"
}
variable  "pm_api_token" {
    default =  "opentofu@pve!provider=XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX"
}
variable  "target_node" {
    default =  "PROXMOX_NODE"
}
variable  "ssh_key" {
    default =  "ssh-ed25519 XXXXXXXXXXXXXXXXXXXXXXXXXXXXX  USER@HOST"
}