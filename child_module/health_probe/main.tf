resource "azurerm_lb_probe" "health_probe" {
  name            = var.health_probe_name
  port            = 80
  loadbalancer_id = var.lb_id
  interval_in_seconds = 5           # probe frequency
  number_of_probes    = 2           # unhealthy threshold
}

output "health_probe_id" {
  value = azurerm_lb_probe.health_probe.id
}




