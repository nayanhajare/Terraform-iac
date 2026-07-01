resource "azurerm_resource_group" "rg-dev-test" {
  for_each = toset(var.rg_name)
  name     = each.value
  location = "West europe"
}

# resource "azurerm_storage_account" "rg-storage-name" {
#   name = "heyitsStorage"
#   resource_group_name = azurerm_resource_group.rg-dev-test.name
#   location = azurerm_resource_group.rg-dev-test.location
#   account_tier = "LRS"
#     account_replication_type = "Standard"
# }






