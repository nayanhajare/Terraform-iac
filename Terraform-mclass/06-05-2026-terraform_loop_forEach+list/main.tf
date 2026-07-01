variable "x" {

}

resource "azurerm_resource_group" "name-test-rg1" {
  for_each = toset(var.x)
  name     = each.key
  location = "West Europe"
}