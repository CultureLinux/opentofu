resource "proxmox_virtual_environment_vm" "batch_vm" {

  for_each = {
    for index,vm in var.all_vm_config:
    vm.name => vm
  }

  name        = each.value.name
  description = "Managed by opentofu"
  tags        = ["opentofu", each.value.name]
  node_name = var.target_node
  clone {
    vm_id = each.value.vmid2clone
  }

  cpu {
    cores = each.value.cpu
    type = "host"
    numa = true
  }
  memory {
    dedicated = each.value.ram
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
    size = each.value.size
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
    ip_config {
      ipv4 {
        address = format("%s%s%s","192.168.1.",180 + each.value.idx,"/24")
        gateway = "192.168.1.1"
      }
    }

    dns {
      servers = ["10.0.0.13"]
    }

    user_account {
      keys     = [var.ssh_key]
      password = "tofu"
      username = each.value.username
    }
  }
}