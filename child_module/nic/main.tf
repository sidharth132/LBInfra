resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name
  

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    
    
  }
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}


resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_pool" {
  network_interface_id    = azurerm_network_interface.nic.id
  ip_configuration_name   = "internal"              # upar wale NIC ip_configuration ka name
  backend_address_pool_id = var.backend_pool_id     # LB module ka output
}
