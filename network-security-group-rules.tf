resource "azurerm_network_security_rule" "AllowF5VPN" {
  access                      = "Allow"
  description                 = "Allow Traffic from F5 VPN"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Inbound"
  name                        = "AllowF5VPN"
  network_security_group_name = azurerm_network_security_group.nsg.name
  priority                    = 100
  protocol                    = "*"
  resource_group_name         = var.resource_group_name
  source_address_prefix       = "10.99.19.0/24"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "DenyAzureLoadBalancerInbound" {
  access                      = "Deny"
  description                 = "Deny Traffic from Azure Load Balancer"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Inbound"
  name                        = "DenyAzureLoadBalancerInbound"
  network_security_group_name = azurerm_network_security_group.nsg.name
  priority                    = 4096
  protocol                    = "*"
  resource_group_name         = var.resource_group_name
  source_address_prefix       = "AzureLoadBalancer"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "DenyVirtualNetworkInbound" {
  access                      = "Deny"
  description                 = "Deny Traffic from Virtual Network"
  destination_address_prefix  = "*"
  destination_port_range      = "*"
  direction                   = "Inbound"
  name                        = "DenyVirtualNetworkInbound"
  network_security_group_name = azurerm_network_security_group.nsg.name
  priority                    = 4095
  protocol                    = "*"
  resource_group_name         = var.resource_group_name
  source_address_prefix       = "VirtualNetwork"
  source_port_range           = "*"
}