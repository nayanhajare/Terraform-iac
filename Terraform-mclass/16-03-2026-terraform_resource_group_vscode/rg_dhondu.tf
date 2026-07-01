terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a7701825-76be-458b-b49e-dab0ed5d65b6"
}
resource "azurerm_resource_group" "nayan1_rg_3_4_26" {
  name     = "nayan_rg_3_4_26"
  location = "West Europe"
}