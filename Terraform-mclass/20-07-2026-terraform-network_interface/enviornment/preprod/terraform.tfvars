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
}

pips = {
  pip1 = {
    name                = "frontend-vm-pip"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend-vm-pip"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    allocation_method   = "Static"
  }
}
nics = {
  nic1 = {
    nic_name     = "frontend-vm-nic"
    nic_location = "centralindia"
    nic_rg       = "nayanrg"
    subnet_id    = "frontend-subnet"
    pip_id       = "frontend-vm-pip"
  }
  nic2 = {
    nic_name     = "backend-vm-nic"
    nic_location = "centralindia"
    nic_rg       = "nayanrg"
    subnet_id    = "backend-subnet"
    pip_id       = "backend-vm-pip"
  }
}