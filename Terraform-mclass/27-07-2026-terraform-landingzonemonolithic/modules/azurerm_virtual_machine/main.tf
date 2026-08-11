data "azurerm_subnet" "subnet" {
  for_each = var.nics
  name = each.value.subnetname
  virtual_network_name = each.value.vnet
  resource_group_name = each.value.rg
}

resource "azurerm_network_interface" "nics" {
  for_each = var.nics

  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.rg

  ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_assoc" {
  for_each = { for k, v in var.nics : k => v if contains(keys(var.lb_backend_pool_ids), k) }

  network_interface_id    = azurerm_network_interface.nics[each.key].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = var.lb_backend_pool_ids[each.key]
}


resource "azurerm_linux_virtual_machine" "example" {
  for_each = var.nics
  name                = each.value.vm_name
  resource_group_name = each.value.rg
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}