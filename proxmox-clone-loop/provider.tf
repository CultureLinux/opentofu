terraform {
    required_providers {
        proxmox =  {
        source = "bpg/proxmox"
        version = ">= 0.43.2"
        }
    }
}

provider "proxmox" {
    
}