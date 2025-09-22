resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.255.224/27"]
}

output "bastion_subnet_id" {
    value = azurerm_subnet.bastion_subnet.id
  
}




