#example1 === rg+ storage account + impcit dependency

resource "azurerm_resource_group" "rg_dev1" {
  name     = "rag-develpoment"
  location = "West Europe"
}


#implicit = which referce internally resource group and terraform automatically detect it 
# resource "azurerm_storage_account" "rg-dev-storage" {
#   name                     = "developmengtest234"
#   resource_group_name      = azurerm_resource_group.rg_dev1.name
#   location                 = azurerm_resource_group.rg_dev1.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# explicit = which referce resource group value maunally with depends_on meta argument

resource "azurerm_storage_account" "rg-dev-storage" {
  depends_on = [azurerm_resource_group.rg_dev1]

  name                     = "development12141"
  resource_group_name      = "rag-develpoment"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
