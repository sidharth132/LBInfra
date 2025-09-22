resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = var.lb_id
  name                           = var.lb_rule_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
 backend_address_pool_ids = [
    var.backend_pool_id  # list me pass karo
  ]
probe_id                = var.health_probe_id

}




