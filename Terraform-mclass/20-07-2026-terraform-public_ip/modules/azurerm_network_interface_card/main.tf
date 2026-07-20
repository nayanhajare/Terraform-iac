variable "nics" {
  
}
data "azurerm_subnet" "subnets" {
    for_each = var.nics
  name = each.value.subnet_id
  virtual_network_name = "nayanvnet"
  resource_group_name = "nayanrg"
}

data "azurerm_public_ip" "datapips" {
    for_each = var.nics
  name = each.value.pip_id
  resource_group_name = "nayanrg"
}


resource "azurerm_network_interface" "nics" {
  for_each = var.nics

name = each.value.nic_name
resource_group_name = each.value.nic_rg
location = each.value.nic_location

ip_configuration {
  name = "internal"
  subnet_id = data.azurerm_subnet.subnets[each.key].id
public_ip_address_id = data.azurerm_public_ip.datapips[each.key].id
  private_ip_address_allocation = "Dynamic"
}

}