variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  default = {}
}

variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
  default = {}
}

variable "subnets" {
  type = map(object({
    name                 = string
    virtual_network_name = string
    resource_group_name  = string
    address_prefixes     = list(string)
  }))
  default = {}
}

variable "nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
  default = {}
}

variable "key_vaults" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
  }))
  default = {}
}

variable "mssql_servers" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    admin_username      = string
    sql_version         = string
  }))
  default = {}
}

variable "storage_accounts" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_replication_type = string
    account_tier             = string
  }))
  default = {}
}

variable "private_endpoints" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_key           = string
    storage_account_key  = string
    subresource_names    = list(string)
  }))
  default = {}
}

variable "service_plans" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    os_type              = string
    sku_name             = string
    function_app_name    = string
    storage_account_key  = string
  }))
  default = {}
}

variable "windows_web_apps" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    service_plan_key    = string
  }))
  default = {}
}

variable "virtual_machines" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_key          = string
    vm_size             = string
    admin_username      = string
  }))
  default = {}
}
