variable "stg1" {

}

resource "azurerm_storage_account" "stg1" {
  for_each                 = var.stg1
  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = each.value.rgn
  account_replication_type = each.value.art
  account_tier             = each.value.at

}

