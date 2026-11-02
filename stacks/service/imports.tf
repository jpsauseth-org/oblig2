# PR B: tar inn ressursene network, data og app slipper.
# ID-ene bygges fra shared-network, aldri skrevet av (K5). Slettes i PR C.
locals {
  rg_id     = local.sn.resource_group_id
  nsg_id    = "${local.rg_id}/providers/Microsoft.Network/networkSecurityGroups/nsg-${var.tjeneste}"
  snet_id   = "${local.sn.vnet_id}/subnets/snet-${var.tjeneste}"
  er_vm     = var.runtime == "vm" ? toset(["vm"]) : toset([])
  er_webapp = var.runtime == "webapp" ? toset(["webapp"]) : toset([])
}

import {
  to = module.subnet.azurerm_subnet.this
  id = local.snet_id
}

import {
  to = module.subnet.azurerm_network_security_group.this
  id = local.nsg_id
}

import {
  to = module.subnet.azurerm_network_security_rule.http
  id = "${local.nsg_id}/securityRules/allow-http"
}

import {
  to = module.subnet.azurerm_subnet_network_security_group_association.this
  id = local.snet_id
}

import {
  to = module.storage.azurerm_storage_account.this
  id = "${local.rg_id}/providers/Microsoft.Storage/storageAccounts/st${var.kortnavn}${var.tjeneste}${var.miljo}"
}

import {
  to = module.keyvault.azurerm_key_vault.this
  id = "${local.rg_id}/providers/Microsoft.KeyVault/vaults/kv-${var.kortnavn}-${var.tjeneste}-${var.miljo}"
}

import {
  for_each = local.er_vm
  to       = module.vm[0].azurerm_public_ip.this
  id       = "${local.rg_id}/providers/Microsoft.Network/publicIPAddresses/pip-${var.tjeneste}"
}

import {
  for_each = local.er_vm
  to       = module.vm[0].azurerm_network_interface.this
  id       = "${local.rg_id}/providers/Microsoft.Network/networkInterfaces/nic-${var.tjeneste}"
}

import {
  for_each = local.er_vm
  to       = module.vm[0].azurerm_linux_virtual_machine.this
  id       = "${local.rg_id}/providers/Microsoft.Compute/virtualMachines/vm-${var.tjeneste}"
}

import {
  for_each = local.er_webapp
  to       = module.webapp[0].azurerm_service_plan.this
  id       = "${local.rg_id}/providers/Microsoft.Web/serverFarms/asp-${var.tjeneste}"
}

import {
  for_each = local.er_webapp
  to       = module.webapp[0].azurerm_linux_web_app.this
  id       = "${local.rg_id}/providers/Microsoft.Web/sites/app-${var.kortnavn}-${var.tjeneste}-${var.miljo}"
}