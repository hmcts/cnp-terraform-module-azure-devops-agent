provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias           = "current_peering"
  subscription_id = data.azurerm_client_config.current.subscription_id
  client_id       = var.peering_client_id
  client_secret   = var.peering_client_secret
  tenant_id       = data.azurerm_client_config.current.tenant_id
}

provider "azurerm" {
  features {}
  alias           = "prod_peering"
  subscription_id = "<subscription id>"
  client_id       = var.peering_client_id
  client_secret   = var.peering_client_secret
  tenant_id       = data.azurerm_client_config.current.tenant_id
}

provider "azurerm" {
  features {}
  alias           = "nonprod_peering"
  subscription_id = "<subscription id>"
  client_id       = var.peering_client_id
  client_secret   = var.peering_client_secret
  tenant_id       = data.azurerm_client_config.current.tenant_id
}

provider "azurerm" {
  features {}
  alias           = "sbox_peering"
  subscription_id = "<subscription id>"
  client_id       = var.peering_client_id
  client_secret   = var.peering_client_secret
  tenant_id       = data.azurerm_client_config.current.tenant_id
}

provider "azurerm" {
  features {}
  alias           = "mgmt_peering"
  subscription_id = "<subscription id>"
  client_id       = var.peering_client_id
  client_secret   = var.peering_client_secret
  tenant_id       = data.azurerm_client_config.current.tenant_id
}

provider "azurerm" {
  features {}
  alias           = "dns"
  subscription_id = "<subscription id>"
  client_id       = var.peering_client_id
  client_secret   = var.peering_client_secret
  tenant_id       = data.azurerm_client_config.current.tenant_id
}

provider "azurerm" {
  features {}
  alias           = "image_gallery"
  subscription_id = "<subscription id>"
  tenant_id       = data.azurerm_client_config.current.tenant_id
}