variable "rg123" {
}

resource "azurerm_resource_group" "rg123" {
  for_each = var.rg123

  name     = each.value.n
  location = each.value.l
  managed_by = each.value.mb
}


