variable  "target_node" {
    default =  "proxmox"
}
variable  "ssh_key" {
    default =  [
        "ssh-ed25519 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX USER@HOST",
        "ssh-ed25519 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX ANSIBLE@HOST",
    ]
}