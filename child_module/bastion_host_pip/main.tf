# resource "azurerm_bastion_host" "host_pip" {
# depends_on = [
#     azurerm_subnet.bastion_subnet,
#     azurerm_public_ip.bastion_pip
#   ]
#   name                = "pipbastion"
#   location            = var.location
#   resource_group_name = var.rg_name

#   ip_configuration {
#     name                 = "configuration"
#     subnet_id            = var.bastion_subnet_id
#     public_ip_address_id = var.bastion_pip_id
#   }

# }


resource "azurerm_bastion_host" "host_pip" {
  #   depends_on = [
  #   azurerm_subnet.bastion_subnet,
  #   azurerm_public_ip.bastion_pip,mdo
  # ]
 
  name                = "pipbastion"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.bastion_subnet_id      # ✅ variable
    public_ip_address_id = var.bastion_pip_id        # ✅ variable
  }
}


