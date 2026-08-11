data "azurerm_public_ip" "pips" {
  for_each = var.bastions
  name = each.value.publicname
  resource_group_name = each.value.rg

}
data "azurerm_subnet" "subnet" {
  for_each = var.bastions
  name = each.value.subnetname
  virtual_network_name = each.value.vnet
  resource_group_name = each.value.rg
}

resource "azurerm_bastion_host" "bastions" {
  for_each = var.bastions

  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.rg
  ip_configuration {
    name = "configurations"
    subnet_id = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pips[each.key].id

  }
}