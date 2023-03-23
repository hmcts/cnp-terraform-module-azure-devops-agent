data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "vh-infra-ado-dev-rg"
  location = "uksouth"
}

module "ado_agent" {
  source = "git::https://github.com/hmcts/cnp-terraform-module-azure-devops-agent.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vnet_name          = "vh-infra-ado-dev-vnet"
  vnet_address_space = ["10.10.0.0/24"]

  subnet_name           = "vh-infra-ado-dev-snet"
  subnet_address_prefix = ["10.10.0.0/28"]

  peering_client_id     = var.peering_client_id
  peering_client_secret = var.peering_client_secret # PASS THIS SECURELY !

  dns_zones = ["dev.platform.hmcts.net", "demo.platform.hmcts.net"]

  key_vault_name = "vh-infra-ado-dev-kv"

  route_table_name = "vh-infra-ado-dev-rt"

  vmss_name = "vh-infra-ado-dev-vmss"

  nsg_name = "vh-infra-ado-dev-nsg"

  tags = {
    "environment"  = "development"
    "application"  = "vh-azure-devops-agent"
    "builtFrom"    = "hmcts/vh-azure-devops-agent"
    "businessArea" = "Cross-Cutting"
  }

  providers = {
    azurerm.current_peering = azurerm.current_peering
    azurerm.prod_peering    = azurerm.prod_peering
    azurerm.nonprod_peering = azurerm.nonprod_peering
    azurerm.sbox_peering    = azurerm.sbox_peering
    azurerm.mgmt_peering    = azurerm.mgmt_peering
    azurerm.dns             = azurerm.dns
    azurerm.image_gallery   = azurerm.image_gallery
  }
}