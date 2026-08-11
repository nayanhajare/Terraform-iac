resource_groups = {
  "rg1" = {
    name     = "nayanrg"
    location = "centralindia"
  }
}

virtual_networks = {
  "vnet1" = {
    name                = "nayanvnet"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  "sub1" = {
    name                 = "vm-subnet"
    virtual_network_name = "nayanvnet"
    resource_group_name  = "nayanrg"
    address_prefixes     = ["10.0.0.0/24"]
  }
}

nsgs = {
  "nsg1" = {
    name                = "nayan-nsg"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    security_rules = [
      {
        name                       = "AllowRDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

key_vaults = {
  "kv1" = {
    name                = "nayankv110826pre"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    sku_name            = "standard"
  }
}

mssql_servers = {
  "sql1" = {
    name                = "nayan-sql-server"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    admin_username      = "sqladmin"
    sql_version         = "12.0"
  }
}

storage_accounts = {
  "sa1" = {
    name                     = "nayansa110826pre"
    location                 = "centralindia"
    resource_group_name      = "nayanrg"
    account_replication_type = "GRS"
    account_tier             = "Standard"
  }
}

private_endpoints = {
  "pe1" = {
    name                = "nayan-pe"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    subnet_key          = "sub1"
    storage_account_key = "sa1"
    subresource_names   = ["blob"]
  }
}

service_plans = {
  "asp1" = {
    name                = "nayan-asp"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    os_type             = "Windows"
    sku_name            = "B1"
    function_app_name   = "nayanfunc110826pre"
    storage_account_key = "sa1"
  }
}

windows_web_apps = {
  "app1" = {
    name                = "nayanapp110826pre"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    service_plan_key    = "asp1"
  }
}

virtual_machines = {
  "vm1" = {
    name                = "frontend-vm"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    subnet_key          = "sub1"
    vm_size             = "Standard_D4_v5"
    admin_username      = "adminuser"
  }
}
