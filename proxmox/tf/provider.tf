provider "proxmox" {
  endpoint = var.proxmox_api_url
  api_token = var.proxmox_api_token

  # because self-signed TLS certificate is in use
  insecure = true
}

