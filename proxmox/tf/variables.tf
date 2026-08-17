# User Variables
variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token" {
  type      = string
  sensitive = true
}



# Kluster Variables
variable "name" {
  description = "Virtual machine name"
  type        = string
}

variable "cpu" {
  description = "Number of CPU cores"
  type        = number
}

variable "memory" {
  description = "Memory size in MiB"
  type        = number
}

variable "disk" {
  description = "Disk size in GiB"
  type        = number
}

variable "bridge" {
  description = "Proxmox network bridge"
  type        = string
}

variable "vlan_id" {
  description = "Proxmox network bridge"
  type        = number
}

variable "os_filename" {
  description = "Proxmox image used to create the virtual machine"
  type        = string
}

variable "os_filepath" {
  description = "Proxmox image used to create the virtual machine"
  type        = string
}

