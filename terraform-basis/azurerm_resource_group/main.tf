#provider

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.76.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
#rg

resource "azurerm_resource_group" "rg1" {
  name     = "nayanrg1"
  location = "West Europe"
}


# block_name{
#     #argument
# }

# block_name "kuch"{

# }

# block_name "kuch" "blockn"{

# }
