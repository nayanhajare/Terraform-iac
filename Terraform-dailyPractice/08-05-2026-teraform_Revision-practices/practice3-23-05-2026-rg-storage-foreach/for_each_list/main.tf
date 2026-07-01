

resource "azurerm_resource_group" "rg11" {
  for_each = toset(var.rg11)

  name     = each.key
  location = "westus"
}





