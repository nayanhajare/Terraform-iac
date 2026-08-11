rggs = {
  rg1 = {
    name     = "nayanrg"
    location = "centralindia"
  }
}

vnetts = {
  vnet1 = {
    name                = "nayanvnets"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "nayanvnets1"
    location            = "centralindia"
    resource_group_name = "nayanrg"
    address_space       = ["10.1.0.0/16"]
  }
}
subnetts = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "nayanrg"
    virtual_network_name = "nayanvnets"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "nayanrg"
    virtual_network_name = "nayanvnets"
    address_prefixes     = ["10.0.1.0/24"]
  }
}