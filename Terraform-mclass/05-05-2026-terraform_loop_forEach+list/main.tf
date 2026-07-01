

variable "rg-qa1" {}

resource "azurerm_resource_group" "rg-loop" {
    for_each = toset(var.rg-qa1)
  name = each.value
  location = "West Europe"
}