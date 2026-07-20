

module "resource_gorup" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_gorup]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_gorup]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
}

module "nic" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../modules/azurerm_network_interface_card"
  nics       = var.nics
}