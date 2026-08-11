rgs = {
  rg1 = {
    name     = "nayanrgs"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "nayanvnets"
    location            = "centralindia"
    resource_group_name = "nayanrgs"
    address_space       = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    virtual_network_name = "nayanvnets"
    resource_group_name  = "nayanrgs"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    virtual_network_name = "nayanvnets"
    resource_group_name  = "nayanrgs"
    address_prefixes     = ["10.0.1.0/24"]
  }
}


pips = {
  pip1 = {
    name                = "frontend-pip"
    resource_group_name = "nayanrgs"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend-pip"
    resource_group_name = "nayanrgs"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}





nics = {
  nic1 = {
    nic_name    = "frontend-vm-nic"
    location    = "centralindia"
    rg_name     = "nayanrgs"
    pip_name    = "frontend-pip"
    subnet_name = "frontend-subnet"
    vnet_name   = "nayanvnets"

    vm_name        = "frontend-vm"
    vm_size        = "Standard_B1s"
    admin_username = "nayanadmin"
    admin_password = "@Simsim#123"
    publisher      = "Canonical"
    offer          = "0001-com-ubuntu-server-jammy"
    sku            = "22_04-lts"
    version        = "latest"

  }
  nic2 = {
    nic_name    = "backend-vm-nic"
    location    = "centralindia"
    rg_name     = "nayanrgs"
    pip_name    = "backend-pip"
    subnet_name = "backend-subnet"
    vnet_name   = "nayanvnets"

    vm_name        = "backend-vm"
    vm_size        = "Standard_B1s"
    admin_username = "nayanadmin"
    admin_password = "@Simsim#123"
    publisher      = "Canonical"
    offer          = "0001-com-ubuntu-server-jammy"
    sku            = "22_04-lts"
    version        = "latest"
  }
}