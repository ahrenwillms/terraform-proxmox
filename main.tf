resource "proxmox_vm_qemu" "virtual_machines" {
  for_each = var.virtual_machines

  name        = each.value.hostname
  target_node = each.value.target_node
  vmid        = each.value.vmid
  clone       = each.value.vm_template
  agent       = 1
  os_type     = "cloud-init"
  cores       = each.value.cpu_cores
  sockets     = each.value.cpu_sockets
  cpu         = "host"
  memory      = each.value.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  
  disk {
    slot     = 0
    size     = each.value.hdd_size
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 0
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Cloud-init config
  ipconfig0 = "ip=${each.value.ip_address},gw=${each.value.gateway}"
  nameserver = "1.1.1.1"
  ciuser    = "ubuntu"
  sshkeys   = file("~/.ssh/id_rsa.pub")
}

output "vm_ipv4_addresses" {
  value = {
    for instance in proxmox_vm_qemu.virtual_machines :
    instance.name => instance.default_ipv4_address
  }
}
