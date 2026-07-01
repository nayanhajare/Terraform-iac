variable "rg_name1"{}
variable "rg_location1" {}

resource "azurerm_resource_group" "rg-eng" {
  name = var.rg_name1
  location = var.rg_location1
}