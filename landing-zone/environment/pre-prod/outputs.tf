output "resource_group_names" {
  value = { for k, v in module.resource_groups : k => v.name }
}

output "vnet_ids" {
  value = { for k, v in module.virtual_networks : k => v.id }
}

output "vm_ids" {
  value = { for k, v in module.virtual_machines : k => v.id }
}

output "key_vault_uris" {
  value = { for k, v in module.key_vaults : k => v.vault_uri }
}
