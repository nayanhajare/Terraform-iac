
rgs = {
  rg1 = {
    name     = "nayanrg"
    location = "centralindia"
  }
}
vnets = {
  vnet1 = {
    name                = "nayanvnet"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    address_space       = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    virtual_network_name = "nayanvnet"
    resource_group_name  = "nayanrg"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    virtual_network_name = "nayanvnet"
    resource_group_name  = "nayanrg"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "nayanvnet"
    resource_group_name  = "nayanrg"
    address_prefixes     = ["10.0.2.0/26"]
  }
}
pips = {
  pip1 = {
    name                = "frontend-pip"
    resource_group_name = "nayanrg"
    location            = "centralindia"

  }
  pip2 = {
    name                = "bastion-pip"
    resource_group_name = "nayanrg"
    location            = "centralindia"

  }
}
bastions = {
  bastion1 = {
    name       = "frontend-bastion"
    location   = "centralindia"
    rg         = "nayanrg"
    vnet       = "nayanvnet"
    subnetname = "AzureBastionSubnet"
    publicname = "bastion-pip"
  }
}
nics = {
  nic1 = {
    name           = "frontend-vm-nic"
    location       = "centralindia"
    rg             = "nayanrg"
    vnet           = "nayanvnet"
    subnetname     = "frontend-subnet"
    vm_name        = "frontend-vm"
    size           = "Standard_D4_v5"
    admin_username = "nayanadmin"
    admin_password = "@Simsim#123"
  }
}
lbs = {
  lb1 = {
    name       = "frontend-lb"
    location   = "centralindia"
    rg         = "nayanrg"
    publicname = "frontend-pip"
  }
}