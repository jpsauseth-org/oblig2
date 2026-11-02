output "resource_group_name" {
  description = "resource group. navnet vi leser på gruppa"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "group id. Service bygger import-ID-ene fra den."
  value       = azurerm_resource_group.this.id
}

output "location" {
  description = "location were working in"
  value       = azurerm_resource_group.this.location
}

output "vnet_name" {
  description = "name of the vnet. navnet vi leser"
  value       = module.vnet.name
}

output "vnet_id" {
  description = "id of the vnet"
  value       = module.vnet.id
}