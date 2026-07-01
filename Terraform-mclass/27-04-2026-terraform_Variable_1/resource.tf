resource "azurerm_resource_group" "prod" {
  name     = var.x
  location = "West Europe"
}

resource "azurerm_resource_group" "qa" {
  name     = var.y
  location = "West Europe"
}
resource "azurerm_resource_group" "test" {
  name     = var.z
  location = "West Europe"
}