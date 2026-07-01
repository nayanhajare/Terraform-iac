terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.64.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "a7701825-76be-458b-b49e-dab0ed5d65b6"
}

resource "azurerm_resource_group" "nayan_test" {
  name     = "nayan_notepad_16_03"
  location = "West Europe"
}