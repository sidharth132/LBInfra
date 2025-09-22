resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = var.lb_id
  name            = var.backend_pool_name
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}
