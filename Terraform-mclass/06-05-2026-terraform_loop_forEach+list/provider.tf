terraform {
  required_providers {
    azurerm = {
      #   source  = "hashicrop/azurerm"
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
}
provider "azurerm" {
  features {}
}