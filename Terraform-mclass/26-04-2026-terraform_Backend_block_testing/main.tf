terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
  backend "azurerm" {
     resource_group_name = "nayan_backend_tested"
    storage_account_name = "jsttestingexplicit"                             # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "justtestingstatefile"                              # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prodtest.tfstate" 
  }

}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "nayan_backend" {
  name     = "nayan_backend_tested"
  location = "West Europe"
}


resource "azurerm_storage_account" "storage_acc123" {
    depends_on = [ azurerm_resource_group.nayan_backend ]

  name                     = "jsttestingexplicit"
  resource_group_name      =  "nayan_backend_tested"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}