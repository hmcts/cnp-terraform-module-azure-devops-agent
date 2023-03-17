data "azurerm_virtual_network" "hmcts-hub-prod-int" {
  name                = "hmcts-hub-prod-int"
  resource_group_name = "hmcts-hub-prod-int"
  provider            = azurerm.prod_peering
}

data "azurerm_virtual_network" "ukw-hub-prod-int" {
  name                = "ukw-hub-prod-int"
  resource_group_name = "ukw-hub-prod-int"
  provider            = azurerm.prod_peering
}

data "azurerm_virtual_network" "hmcts-hub-nonprodi" {
  name                = "hmcts-hub-nonprodi"
  resource_group_name = "hmcts-hub-nonprodi"
  provider            = azurerm.nonprod_peering
}

data "azurerm_virtual_network" "ukw-hub-nonprodi" {
  name                = "ukw-hub-nonprodi"
  resource_group_name = "ukw-hub-nonprodi"
  provider            = azurerm.nonprod_peering
}

data "azurerm_virtual_network" "core-infra-vnet-mgmt" {
  name                = "core-infra-vnet-mgmt"
  resource_group_name = "rg-mgmt"
  provider            = azurerm.mgmt_peering
}

locals {
  hubs = {
    "hmcts-hub-prod-int"   = data.azurerm_virtual_network.hmcts-hub-prod-int.id
    "ukw-hub-prod-int"     = data.azurerm_virtual_network.ukw-hub-prod-int.id
    "hmcts-hub-nonprodi"   = data.azurerm_virtual_network.hmcts-hub-nonprodi.id
    "ukw-hub-nonprodi"     = data.azurerm_virtual_network.ukw-hub-nonprodi.id
    "core-infra-vnet-mgmt" = data.azurerm_virtual_network.core-infra-vnet-mgmt.id
  }
}

resource "azurerm_virtual_network_peering" "vnet_TO_hubs" {
  for_each                  = local.hubs
  name                      = "${var.vnet_name}-TO-${each.key}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = each.value
  provider                  = azurerm.current_peering
}

resource "azurerm_virtual_network_peering" "hmcts-hub-prod-int_TO_vnet" {
  name                      = "hmcts-hub-prod-int-TO-${var.vnet_name}"
  resource_group_name       = data.azurerm_virtual_network.hmcts-hub-prod-int.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.hmcts-hub-prod-int.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  provider                  = azurerm.prod_peering
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "ukw-hub-prod-int_TO_vnet" {
  name                      = "ukw-hub-prod-int-TO-${var.vnet_name}"
  resource_group_name       = data.azurerm_virtual_network.ukw-hub-prod-int.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.ukw-hub-prod-int.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  provider                  = azurerm.prod_peering
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "hmcts_hub_nonprodi_TO_vnet" {
  name                      = "hmcts-hub-nonprodi-TO-${var.vnet_name}"
  resource_group_name       = data.azurerm_virtual_network.hmcts-hub-nonprodi.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.hmcts-hub-nonprodi.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  provider                  = azurerm.nonprod_peering
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "ukw_hub_nonprodi_TO_vnet" {
  name                      = "ukw-hub-nonprodi-TO-${var.vnet_name}"
  resource_group_name       = data.azurerm_virtual_network.ukw-hub-nonprodi.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.ukw-hub-nonprodi.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  provider                  = azurerm.nonprod_peering
  allow_forwarded_traffic   = true
}

resource "azurerm_virtual_network_peering" "core-infra-vnet-mgmt_TO_vnet" {
  name                      = "core-infra-vnet-mgmt-TO-${var.vnet_name}"
  resource_group_name       = data.azurerm_virtual_network.core-infra-vnet-mgmt.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.core-infra-vnet-mgmt.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id
  provider                  = azurerm.mgmt_peering
  allow_forwarded_traffic   = true
}