terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 3.46.0"
      configuration_aliases = [azurerm.current_peering, azurerm.prod_peering, azurerm.nonprod_peering, azurerm.sbox_peering, azurerm.mgmt_peering, azurerm.dns, azurerm.image_gallery]
    }
  }
}