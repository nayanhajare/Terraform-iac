variable "vnet-1" {

}
resource "azurerm_virtual_network" "vnet-1" {
  for_each            = var.vnet-1
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgn
  address_space       = each.value.ad_s
}

