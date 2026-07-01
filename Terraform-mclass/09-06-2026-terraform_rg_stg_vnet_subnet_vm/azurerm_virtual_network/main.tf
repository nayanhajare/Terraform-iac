

# resource "azurerm_resource_group" "example" {
#   location = "West Europe"
# }

resource "azurerm_network_security_group" "example" {
  name                = "nsg-rg-devopas"
  location            = "southindia"
  resource_group_name = "rg-vnet-1"
}

resource "azurerm_virtual_network" "example" {
  name                = "vnet-devops-1"
  location            = "southindia"
  resource_group_name = "rg-vnet-1"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

}