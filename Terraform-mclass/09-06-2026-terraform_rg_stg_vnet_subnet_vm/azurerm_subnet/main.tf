
resource "azurerm_subnet" "example" {
  name                 = "frontend-subnet"
resource_group_name  = "rg-vnet-1"
  virtual_network_name = "vnet-devops-1"
  address_prefixes     = ["10.0.1.0/24"]


}

resource "azurerm_subnet" "example" {
  name                 = "backend-subnet"
  resource_group_name  = "rg-vnet-1"
  virtual_network_name = "vnet-devops-1"
  address_prefixes     = ["10.0.2.0/24"]


}