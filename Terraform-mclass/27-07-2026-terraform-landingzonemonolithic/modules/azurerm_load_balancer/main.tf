data "azurerm_public_ip" "pips" {
  for_each            = var.lbs
  name                = each.value.publicname
  resource_group_name = each.value.rg
}

resource "azurerm_lb" "lbs" {
  for_each            = var.lbs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pips[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pools" {
  for_each        = var.lbs
  name            = "BackEndAddressPool"
  loadbalancer_id = azurerm_lb.lbs[each.key].id
}

resource "azurerm_lb_probe" "probes" {
  for_each        = var.lbs
  name            = "http-probe"
  loadbalancer_id = azurerm_lb.lbs[each.key].id
  port            = 80
  protocol        = "Http"
  request_path    = "/"
}

resource "azurerm_lb_rule" "rules" {
  for_each                       = var.lbs
  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.lbs[each.key].id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pools[each.key].id]
  probe_id                       = azurerm_lb_probe.probes[each.key].id
}
