terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "ssh_key" {
  type      = string
  sensitive = true
}

provider "proxmox" {

    # These three values are imported from the pm-credentials.auto.tfvars file
    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret

    # (Optional) Skip TLS Verification
    # pm_tls_insecure = true

    # Declare number of parallel processes
    pm_parallel = 2

    # Uncomment the below for debugging.
    pm_log_enable = true
    pm_log_file   = "terraform-plugin-proxmox.log"
    pm_debug      = true
    pm_log_levels = {
      _default    = "debug"
      _capturelog = ""
    }
}