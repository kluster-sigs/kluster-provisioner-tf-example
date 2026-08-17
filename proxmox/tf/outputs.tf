output "vm_password" {
  description = "Generated VM password"
  value       = random_password.ubuntu_vm.result
  sensitive   = true
}

output "vm_private_key" {
  description = "Generated VM private SSH key"
  value       = tls_private_key.ubuntu_vm.private_key_pem
  sensitive   = true
}

output "vm_public_key" {
  description = "Generated VM public SSH key"
  value       = tls_private_key.ubuntu_vm.public_key_openssh
}
