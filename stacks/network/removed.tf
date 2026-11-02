#ressursgruppa og VNet-et flyttes til shared-network.
#destroy = false: ut av state, men står igjen i Azure.

#slettet main, outputs og variables
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

removed {
  from = module.subnet
  lifecycle {
    destroy = false
  }
}