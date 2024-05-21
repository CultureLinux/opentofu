variable  "target_node" {
    default =  "proxmox"
}
variable  "ssh_key" {
    default =  "ssh-ed25519 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX USER@HOST"
}


variable "all_vm_config" {
    type = list(object({
        idx = number
        name = string
        vmid2clone = number
        cpu = number
        ram = number
        size = number 
        username = string
    }))
    default = [
        {
            idx = 0
            name = "rocky9-jetable"
            vmid2clone = 1001
            cpu = 3
            ram = 2048
            size = 10 
            username = "rocky"        
        },  
        {
            idx = 1
            name = "debian2"
            vmid2clone = 1000
            cpu = 1
            ram = 2048
            size = 5 
            username = "debian"        
        },                                                                                                 
    ]
}

