#ressursgruppa og VNet-et flyttes til shared-network.
#destroy = false: ut av state, men står igjen i Azure.
removed {
  from = azurerm_resource_group.this
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.vnet
  lifecycle {
    destroy = false
  }
}