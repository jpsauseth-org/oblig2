#VM (med NIC og offentlig IP) og App Service-plan + web app flyttes til service.
#sletter main, outputs, og variables
removed {
  from = module.vm
  lifecycle {
    destroy = false
  }
}

removed {
  from = module.webapp
  lifecycle {
    destroy = false
  }
}