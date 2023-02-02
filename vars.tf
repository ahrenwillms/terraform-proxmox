variable "proxmox_host" {
  default = "192.168.1.149"
}

variable "virtual_machines" {
  default = {
    "load-balancer" = {
      hostname    = "load-balancer",
      ip_address  = "192.168.1.241/24",
      gateway     = "192.168.1.254",
      target_node = "pve",
      vmid        = 241,
      cpu_cores   = 2,
      cpu_sockets = 1,
      memory      = "2048",
      hdd_size    = "16G",
      vm_template = "ubuntu-2204-cloud-init"
    },
    "nginx-01" = {
      hostname    = "nginx-01",
      ip_address  = "192.168.1.242/24",
      gateway     = "192.168.1.254",
      target_node = "pve",
      vmid        = 242,
      cpu_cores   = 2,
      cpu_sockets = 1,
      memory      = "2048",
      hdd_size    = "16G",
      vm_template = "ubuntu-2204-cloud-init"
    },
    "nginx-02" = {
      hostname    = "nginx-02",
      ip_address  = "192.168.1.243/24",
      gateway     = "192.168.1.254",
      target_node = "pve",
      vmid        = 243,
      cpu_cores   = 2,
      cpu_sockets = 1,
      memory      = "2048",
      hdd_size    = "16G",
      vm_template = "ubuntu-2204-cloud-init"
    },
    "nginx-03" = {
      hostname    = "nginx-03",
      ip_address  = "192.168.1.244/24",
      gateway     = "192.168.1.254",
      target_node = "pve",
      vmid        = 244,
      cpu_cores   = 2,
      cpu_sockets = 1,
      memory      = "2048",
      hdd_size    = "16G",
      vm_template = "ubuntu-2204-cloud-init"
    }
  }
}
