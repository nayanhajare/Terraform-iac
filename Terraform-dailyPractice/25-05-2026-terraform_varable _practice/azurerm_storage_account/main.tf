resource "azurerm_storage_account" "stg12435" {

  for_each = var.stg12435

  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  account_tier             = each.value.at
  account_replication_type = each.value.ars
}