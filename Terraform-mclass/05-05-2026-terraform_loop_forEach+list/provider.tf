terraform {
  required_providers {
    azurerm = {
     source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "nayan_backend_tested"
    storage_account_name = "jsttestingexplicit"
    container_name       = "justtestingstatefile"
    key                  = "prod_forEacd_list.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
