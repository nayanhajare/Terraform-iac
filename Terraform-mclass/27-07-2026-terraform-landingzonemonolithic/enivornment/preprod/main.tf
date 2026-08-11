
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
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
}

module "bastion" {
  depends_on = [module.resource_group, module.public_ip, module.subnet]
  source     = "../../modules/azurerm_bastion"
  bastions   = var.bastions
}
module "virtual_machine" {
  depends_on          = [module.public_ip, module.subnet, module.load_balancer]
  source              = "../../modules/azurerm_virtual_machine"
  nics                = var.nics
  lb_backend_pool_ids = { "nic1" = module.load_balancer.backend_pool_ids["lb1"] }
}

module "load_balancer" {
  depends_on = [module.resource_group, module.public_ip]
  source     = "../../modules/azurerm_load_balancer"
  lbs        = var.lbs
}