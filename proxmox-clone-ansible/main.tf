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
      keys     = var.ssh_key
      password = "tofu"
      username = "debian"
    }
  }
}

resource "local_file" "inventory" {
  content  = <<EOF
[debian12]
${ proxmox_virtual_environment_vm.debian_vm.name } ansible_host=${ split( "/", proxmox_virtual_environment_vm.debian_vm.initialization[0].ip_config[0].ipv4[0].address)[0]} ansible_user=${ proxmox_virtual_environment_vm.debian_vm.initialization[0].user_account[0].username }
EOF
  filename = "inventory.yml"

  provisioner "local-exec" {
    when = create
    environment = {
      ANSIBLE_HOST_KEY_CHECKING="False"
      ANSIBLE_HOME="/home/clinux/Codium/InfraAsCode/Ansible/"
      ANSIBLE_INVENTORY="inventory.yml"
    }
    command = <<EOF
        sleep 50
        ansible all -m ping -u debian12
        ansible-playbook $ANSIBLE_HOME/deploy_debian_post_tofu.yml
    EOF
  }
}