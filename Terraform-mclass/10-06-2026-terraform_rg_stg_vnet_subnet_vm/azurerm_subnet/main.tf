variable "subnets" {

}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = each.value.rgn
  virtual_network_name = each.value.vnet
  address_prefixes     = each.value.ap

}
