data "azurerm_client_config" "current" {}

resource "random_password" "sql_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_password" "vm_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

module "resource_groups" {
  source   = "../../child_modules/azurerm_resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
}

module "virtual_networks" {
  source   = "../../child_modules/azurerm_virtual_network"
  for_each = var.virtual_networks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_groups["rg1"].name
  address_space       = each.value.address_space
  
  depends_on = [module.resource_groups]
}

module "subnets" {
  source   = "../../child_modules/azurerm_subnet"
  for_each = var.subnets

  name                 = each.value.name
  virtual_network_name = module.virtual_networks["vnet1"].name
  resource_group_name  = module.resource_groups["rg1"].name
  address_prefixes     = each.value.address_prefixes
}

module "nsgs" {
  source   = "../../child_modules/azurerm_nsg"
  for_each = var.nsgs

  name                = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_groups["rg1"].name
  security_rules      = each.value.security_rules
}

module "key_vaults" {
  source   = "../../child_modules/azurerm_key_vault"
  for_each = var.key_vaults

  name                = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_groups["rg1"].name
  sku_name            = each.value.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  secrets = {
    "sqladmin-password" = random_password.sql_password.result
    "vmadmin-password"  = random_password.vm_password.result
  }
}

module "mssql_servers" {
  source   = "../../child_modules/azurerm_mssql_server"
  for_each = var.mssql_servers

  name                = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_groups["rg1"].name
  sql_version         = each.value.sql_version
  admin_username      = each.value.admin_username
  admin_password      = random_password.sql_password.result
}

module "storage_accounts" {
  source   = "../../child_modules/azurerm_storage_account"
  for_each = var.storage_accounts

  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = module.resource_groups["rg1"].name
  account_replication_type = each.value.account_replication_type
  account_tier             = each.value.account_tier
}

module "private_endpoints" {
  source   = "../../child_modules/azurerm_private_endpoint"
  for_each = var.private_endpoints

  name                           = each.value.name
  location                       = each.value.location
  resource_group_name            = module.resource_groups["rg1"].name
  subnet_id                      = module.subnets[each.value.subnet_key].id
  private_connection_resource_id = module.storage_accounts[each.value.storage_account_key].id
  subresource_names              = each.value.subresource_names
}

module "service_plans" {
  source   = "../../child_modules/azurerm_service_plan"
  for_each = var.service_plans

  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = module.resource_groups["rg1"].name
  os_type                    = each.value.os_type
  sku_name                   = each.value.sku_name
  function_app_name          = each.value.function_app_name
  storage_account_name       = module.storage_accounts[each.value.storage_account_key].name
  storage_account_access_key = module.storage_accounts[each.value.storage_account_key].primary_access_key
}

module "windows_web_apps" {
  source   = "../../child_modules/azurerm_windows_web_app"
  for_each = var.windows_web_apps

  name                = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_groups["rg1"].name
  service_plan_id     = module.service_plans[each.value.service_plan_key].id
}

module "virtual_machines" {
  source   = "../../child_modules/azurerm_virtual_machine"
  for_each = var.virtual_machines

  name                = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_groups["rg1"].name
  subnet_id           = module.subnets[each.value.subnet_key].id
  vm_size             = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password      = random_password.vm_password.result
}
