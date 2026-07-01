variable "rg-test1" {}
variable "rg-test2" {}
variable "rg-test3" {}

resource "azurerm_resource_group" "rg-test1" {
  name     = var.rg-test1
  location = "West Europe"
}

resource "azurerm_resource_group" "rg-test2" {
  name     = var.rg-test2
  location = "West Europe"
}
resource "azurerm_resource_group" "rg-test3" {
  name     = var.rg-test3
  location = "West Europe"
}



