#storage account og Key Vault per tjeneste flyttes til service.
#sletter main, outputs, og variables
removed {
  from = module.storage
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.keyvault
  lifecycle {
    destroy = false
  }
}