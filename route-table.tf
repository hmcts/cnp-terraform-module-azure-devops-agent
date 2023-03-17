resource "azurerm_route_table" "route_table" {
  name                = var.route_table_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_route" "ss-sbox-vnet" {
  name                = "ss-sbox-vnet"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "10.140.0.0/18"
  next_hop_type       = "10.10.200.36"
}

resource "azurerm_route" "ss-dev-vnet" {
  name                = "ss-dev-vnet"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "10.145.0.0/18"
  next_hop_type       = "10.11.72.36"
}

resource "azurerm_route" "ss-demo-vnet" {
  name                = "ss-demo-vnet"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "10.51.64.0/18"
  next_hop_type       = "10.11.72.36"
}

resource "azurerm_route" "ss-ithc-vnet" {
  name                = "ss-ithc-vnet"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "10.143.0.0/18"
  next_hop_type       = "10.11.72.36"
}

resource "azurerm_route" "ss-test-vnet" {
  name                = "ss-test-vnet"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "10.141.0.0/18"
  next_hop_type       = "10.11.72.36"
}

resource "azurerm_route" "ss-stg-vnet" {
  name                = "ss-stg-vnet"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "10.148.0.0/18"
  next_hop_type       = "10.11.8.36"
}

resource "azurerm_route" "ss-prod-vnet" {
  name                = "ss-prod-vnet"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "10.144.0.0/18"
  next_hop_type       = "10.11.8.36"
}

resource "azurerm_subnet_route_table_association" "subnet_route_table" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table.id
}