
resource "azurerm_resource_group" "rg-prod-12" {
  for_each = var.rg-prod-12
  name     = each.value.name
  location = each.value.location
}

