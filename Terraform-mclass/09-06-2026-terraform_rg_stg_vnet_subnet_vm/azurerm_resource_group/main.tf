variable "rg-devops" {

}

resource "azurerm_resource_group" "rg-devops" {
  for_each = var.rg-devops
  name     = each.value.name
  location = each.value.location
}
