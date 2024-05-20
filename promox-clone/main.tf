resource "proxmox_virtual_environment_vm" "debian_vm" {
  name        = "bpg-debian12"
  description = "Managed by opentofu"
  tags        = ["opentofu", "debian"]

  node_name = var.target_node
  clone {
    vm_id = "1000"
  }

  cpu {
    cores = 4
    type = "host"
    numa = true
  }
  memory {
    dedicated = 4096
  }
  network_device {
    bridge = "vmbr0"
    model = "virtio"
  }

  bios = "seabios"
  disk {
    datastore_id = "local-lvm"
    file_format = "qcow2"
    interface = "virtio0"
    size = "12"
  }

  operating_system {
    type = "l26"
  }
  machine = "q35"
  agent {
    enabled = false
  }

  initialization {
    datastore_id = "local-lvm"    
    upgrade = "true"

    ip_config {
      ipv4 {
        address = "192.168.1.180/24"
        gateway = "192.168.1.1"
      }
    }
    dns {
      servers = ["10.0.0.13"]
    }

    user_account {
      keys     = [var.ssh_key]
      password = "tofu"
      username = "debian"
    }
  }
}