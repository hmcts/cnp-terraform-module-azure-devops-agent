resource "tls_private_key" "vmss" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

data "azurerm_shared_image" "devops-ubuntu" {
  count               = var.vmss_source_image_id == null ? 1 : 0
  name                = "devops-ubuntu"
  gallery_name        = "hmcts"
  resource_group_name = "hmcts-image-gallery-rg"
  provider            = azurerm.mgmt
}

resource "azurerm_linux_virtual_machine_scale_set" "vh_ado_agent_vmss" {
  name                = var.vmss_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku       = var.vmss_sku
  instances = var.vmss_instance_count

  admin_username = var.vmss_admin_username

  source_image_id = var.vmss_source_image_id == null ? data.azurerm_shared_image.devops-ubuntu[0].id : var.vmss_source_image_id

  overprovision          = false
  single_placement_group = false

  admin_ssh_key {
    username   = var.vmss_admin_username
    public_key = tls_private_key.vmss.public_key_openssh
  }

  os_disk {
    storage_account_type = "Premium_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${var.vmss_name}-nic"
    primary = true

    ip_configuration {
      name      = "IpConfig"
      primary   = true
      subnet_id = azurerm_subnet.subnet.id
    }
  }

  tags = var.tags
}