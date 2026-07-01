

resource "azurerm_resource_group" "rg12" {
  for_each = var.rg12
  name     = each.key
  location = each.value
}

