variable "rg-stg" {

}

resource "azurerm_storage_account" "rg-stg" {
  for_each                 = var.rg-stg
  name                     = each.value.n
  location                 = each.value.l
  resource_group_name      = each.value.rg
  account_tier             = each.value.at
  account_replication_type = each.value.art

}
