variable "rgs" {

}
variable "vnets" {

}
variable "subnets" {

}
variable "pips" {

}
variable "nics" {

}
module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}
module "pip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
}
module "nic" {
  depends_on = [module.subnet, module.pip]
  source     = "../../modules/azurerm_virtual_machine"
  nics       = var.nics
}