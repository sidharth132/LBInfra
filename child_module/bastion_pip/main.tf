
resource "azurerm_public_ip" "bastion_pip" {
  name                = "bastionpip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

output "bastion_pip_id" {
    value = azurerm_public_ip.bastion_pip.id
  
}






