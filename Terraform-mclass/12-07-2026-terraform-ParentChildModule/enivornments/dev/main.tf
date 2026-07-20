
module "resource_gorup" {
  source = "../../child_modules/azurerm_resource_group"
  rgs    = var.rggs

}
module "virtual_network" {
  depends_on = [module.resource_gorup]
  source     = "../../child_modules/azurerm_virtual_network"
  vnets      = var.vnetts
}
module "subnet" {
  depends_on = [module.resource_gorup, module.virtual_network]
  source     = "../../child_modules/azurerm_subnet"
  subnets    = var.subnetts
}