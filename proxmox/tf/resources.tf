resource "random_password" "ubuntu_vm" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "ubuntu_vm" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name        = var.kluster_machine_name
  description = "Managed by OpenTofu"
  tags        = ["terraform", "ubuntu"]

  node_name     = "PVE-Node-01"

  agent {
    enabled = false
  }

  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = var.cpu
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.memory
    floating  = var.memory
  }

  disk {
    datastore_id = "zfs-pool-01"
    import_from  = var.os_filename
    interface    = "scsi0"
    size         = var.disk
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      keys = [
        trimspace(
          tls_private_key.ubuntu_vm.public_key_openssh
        )
      ]

      password = random_password.ubuntu_vm.result
      username = "ubuntu"
    }
  }

  network_device {
    bridge = var.bridge
  }

  operating_system {
    type = "l26"
  }
}
