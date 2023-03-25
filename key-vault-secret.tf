resource "azurerm_key_vault_secret" "vmss-ssh-private-key" {
  name         = "vmss-ssh-private-key"
  value        = tls_private_key.vmss.private_key_openssh
  key_vault_id = azurerm_key_vault.key_vault.id
  tags         = var.tags

  depends_on = [
    azurerm_key_vault_access_policy.access_policy
  ]
}

resource "azurerm_key_vault_secret" "vmss-ssh-public-key" {
  name         = "vmss-ssh-public-key"
  value        = tls_private_key.vmss.public_key_openssh
  key_vault_id = azurerm_key_vault.key_vault.id
  tags         = var.tags

  depends_on = [
    azurerm_key_vault_access_policy.access_policy
  ]
}