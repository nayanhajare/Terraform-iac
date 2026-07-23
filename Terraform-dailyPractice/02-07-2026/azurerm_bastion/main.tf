resource "azurerm_public_ip" "nayanpip" {

  name                = "nayanpip1"
  location            = "centralindia"
  resource_group_name = "nayanrg1"
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_bastion_host" "name" {
  name                = "nayanbastion"
  location            = "centralindia"
  resource_group_name = "nayanrg1"

  ip_configuration {
    name                 = "nayanconfig"
    subnet_id            = "/subscriptions/7ad7aecf-c069-440e-8f3b-e0894a950176/resourceGroups/nayanrg1/providers/Microsoft.Network/virtualNetworks/nayanvnet1/subnets/AzureBastionSubnet"
    public_ip_address_id = azurerm_public_ip.nayanpip.id
  }

}