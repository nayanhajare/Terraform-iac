resource "azurerm_public_ip" "basition-pip" {
  name                = "bastion-public-ip"
  location            = "centralindia"
  resource_group_name = "rg-nayan-devops"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "basition-host" {
  name                = "AzureBastionSubnet"
  location            = "centralindia"
  resource_group_name = "rg-nayan-devops"

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = "/subscriptions/73950bf5-1ded-4cff-91b1-9f18babff8b7/resourceGroups/rg-nayan-devops/providers/Microsoft.Network/virtualNetworks/vnet-nayan-devops/subnets/public-subnet"
    public_ip_address_id = "/subscriptions/73950bf5-1ded-4cff-91b1-9f18babff8b7/resourceGroups/rg-nayan-devops/providers/Microsoft.Network/publicIPAddresses/bastion-public-ip"
  }
}