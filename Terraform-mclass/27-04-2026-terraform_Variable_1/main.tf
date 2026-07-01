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


# hardcoded hai multiple name se alg alag resource banane ke liye copy paste karna padh raha hai


# resource "azurerm_resource_group" "prod" {
#   name     = "rg-prod420"
#   location = "West Europe"
# }

# resource "azurerm_resource_group" "qa" {
#   name     = "rg-qa420"
#   location = "West Europe"
# }
# resource "azurerm_resource_group" "test" {
#   name     = "rg-test420"
#   location = "West Europe"
# }