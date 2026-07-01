variable "rg_name2" {

}

resource "azurerm_resource_group" "rg-prod2" {
  name     = var.rg_name2
  location = "West Europe"
}
#gives the customise name like .tfvars work
#bahkua.tfvars  ==== terraform.tfvars
#  terraform plan -var-file="bhakua.tfvars"
