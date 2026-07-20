data "azurerm_subnet" "subnet" {
  for_each = var.nics
  name = each.value.subnet_id
  virtual_network_name = "nayanvnet"
  resource_group_name = "nayanrg"
}
data "azurerm_public_ip" "pip" {
  for_each = var.nics
  name = each.value.pip_id
  resource_group_name = each.value.nic_rg
}