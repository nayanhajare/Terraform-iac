terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }

  backend "azurerm" {
    # use_cli              = true                                   # Can also be set via `ARM_USE_CLI` environment variable.
    # use_azuread_auth     = true                                   # Can also be set via `ARM_USE_AZUREAD` environment variable.
    resource_group_name  = "rg-prod"
    tenant_id            = "4dbe4cb2-8eba-4dd5-8c81-57dc988cb9f8" # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "naayanstorage1234"                    # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "sstatefiletesting1"                   # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prodtest.tfstate"                     # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "producton" {
  name     = "rg-prod"
  location = "West Europe"
}

resource "azurerm_storage_account" "st_backend_block" {
  name                     = "naayanstorage1234"
  resource_group_name      = azurerm_resource_group.producton.name
  location                 = azurerm_resource_group.producton.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}