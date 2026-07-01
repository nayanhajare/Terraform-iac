resource "azurerm_public_ip" "publiip" {
  name                = "hajarepip"
  location            = "centralindia"
  resource_group_name = "hajare-rg1"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "example" {
  name                = "hajare-bastion"
  location            = "centralindia"
  resource_group_name = "hajare-rg1"

  ip_configuration {
    name                 = "bastion-configuration"
    subnet_id            = "/subscriptions/73950bf5-1ded-4cff-91b1-9f18babff8b7/resourceGroups/hajare-rg1/providers/Microsoft.Network/virtualNetworks/hajare-vnet1/subnets/AzureBastionSubnet"
    public_ip_address_id = azurerm_public_ip.publiip.id
  }
}

