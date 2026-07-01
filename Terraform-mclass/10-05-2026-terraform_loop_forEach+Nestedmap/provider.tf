terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.72.0"
    }
  }
#   backend "azurerm" {
#     resource_group_name = "rg-nayan-12"
#     storage_account_name = "juststatefilebackup"
#     container_name = "heyitsnayanstatefile"
#     key = "nayan.terraform.tfstate"    
#   }
}
provider "azurerm" {
  features {}
}