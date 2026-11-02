import {
  to = azurerm_resource_group.this
  id = data.azurerm_resource_group.eksisterende.id
}

import {
  to = module.vnet.azurerm_virtual_network.this
  id = "${data.azurerm_resource_group.eksisterende.id}/providers/Microsoft.Network/virtualNetworks/vnet-${var.kortnavn}-${var.miljo}"
}