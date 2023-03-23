data "azurerm_resource_group" "dns" {
  name     = "core-infra-intsvc-rg"
  provider = azurerm.dns

}
resource "azurerm_private_dns_zone_virtual_network_link" "dns" {
  for_each              = toset(var.dns_zones)
  name                  = azurerm_virtual_network.vnet.name
  resource_group_name   = data.azurerm_resource_group.dns.name
  private_dns_zone_name = each.value
  virtual_network_id    = azurerm_virtual_network.vnet.id
  provider              = azurerm.dns
  tags                  = var.tags
}