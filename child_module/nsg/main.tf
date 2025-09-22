resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each                  = var.nic_ids                # 👈 toset hata diya
  network_interface_id      = each.value
  network_security_group_id = azurerm_network_security_group.nsg.id
}


