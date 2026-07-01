terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg-test-nayan" {
  name     = "rg-nayan-1"
  location = "West Europe"
}

resource "azurerm_storage_account" "nayanimplicit" {
  name                     = "nayantestedimplicit1"
  resource_group_name      = azurerm_resource_group.rg-test-nayan.name
  location                 = azurerm_resource_group.rg-test-nayan.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}


