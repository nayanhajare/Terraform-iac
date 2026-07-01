variable "rg_name1" {}
variable "rg_location1" {}

resource "azurerm_resource_group" "rg-prod" {
  name     = var.rg_name1   #terraform plan -var "rg_name1=rg-nayan-test1"
  location = var.rg_location1

}
#terraform plan -var "rg_name1=rg-nayan-test1" -var "rg_location=West Europe"