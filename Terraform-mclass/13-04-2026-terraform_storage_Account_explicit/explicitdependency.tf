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
resource "azurerm_resource_group" "rg-test-nayan1" {
  name     = "rg-nayan-2"
  location = "West Europe"
}

resource "azurerm_storage_account" "nayanexplicit" {
  depends_on = [azurerm_resource_group.rg-test-nayan1]

  name                     = "nayantestedexplicit1"
  resource_group_name      = "rg-nayan-2"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

}


