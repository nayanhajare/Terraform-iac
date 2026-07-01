variable "rgname" {
#   type = string
#   default = "parveen-rg"
}

resource "azurerm_resource_group" "rg1" {
    for_each = var.rgname
  name = each.key
  location = each.value.l
  managed_by = each.value.mb
}

#
