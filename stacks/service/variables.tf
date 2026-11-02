#kopiert fra app/variables
variable "kortnavn" {
  description = "Kortnavnet ditt. Settes i config/felles.tfvars."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{2,10}$", var.kortnavn))
    error_message = "kortnavn må være 2–10 små bokstaver eller tall. Sett det i config/felles.tfvars."
  }
}

variable "location" {
  description = "Azure-regionen. Settes i config/felles.tfvars."
  type        = string
}

variable "miljo" {
  description = "Miljøet. Settes av scripts/kjor.sh (TF_VAR_miljo), ikke i en .tfvars-fil."
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.miljo)
    error_message = "miljo må være dev eller prod."
  }
}

variable "state_resource_group_name" {
  description = "Ressursgruppa til state-kontoen. Settes av scripts/kjor.sh fra shared/backend.hcl."
  type        = string
}

variable "state_storage_account_name" {
  description = "State-kontoen. Settes av scripts/kjor.sh fra shared/backend.hcl."
  type        = string
}

variable "state_container_name" {
  description = "Containeren state ligger i. Settes av scripts/kjor.sh fra shared/backend.hcl."
  type        = string
}


variable "vm_size" {
  description = "VM-størrelsen for tjenester med runtime vm."
  type        = string
  default     = "Standard_B2als_v2"
}

variable "webapp_sku" {
  description = "SKU for App Service-planene til tjenester med runtime webapp."
  type        = string
  default     = "B1"
}

variable "tjeneste" {
  description = "navnet på tjenesten, vil bli brukt i alle ressursnavn"
  type        = string
  validation {
    condition     = can(regex("^[a-z]{2,8}$", var.tjeneste))
    error_message = "tjenestenavn må være 2-8 små bokstaver, så det ikke totalen med storage_name blir over 24 tegn"
  }
}

variable "runtime" {
  description = "Hva tjenesten kjører på (kan være vm eller webapp)"
  type        = string
  validation {
    condition     = contains(["vm", "webapp"], var.runtime)
    error_message = "må inneholde vm/webapp og runtime"
  }
}

variable "prefix" {
  description = "adresseområdet til subnettet"
  type        = string
}

variable "allow_http_from" {
  description = "hvem som får nå tjenesten fra http (port 80)"
  type        = string
  default     = "Internet"
}

variable "ssh_public_key" {
  description = "offentlig nøkkel"
  type        = string
  default     = null
}