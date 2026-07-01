resource "azurerm_public_ip" "publicip" {
  name = "nayan21pip"
  location = "central india"
  resource_group_name = "nayanrg21"
  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_bastion_host" "bastions" {
  name = "nayan21-bastion"
  location = "centralindia"
  resource_group_name = "nayanrg21"

  ip_configuration {
    name = "bastion-config"
    subnet_id = "/subscriptions/73950bf5-1ded-4cff-91b1-9f18babff8b7/resourceGroups/nayanrg21/providers/Microsoft.Network/virtualNetworks/nayanvnet21/subnets/AzureBastionSubnet"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}
