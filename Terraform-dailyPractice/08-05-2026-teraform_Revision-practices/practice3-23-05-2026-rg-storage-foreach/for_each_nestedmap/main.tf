

resource "azurerm_resource_group" "rg113" {
  for_each = var.rg113
  name     = each.value.n
  location = each.value.l

}

