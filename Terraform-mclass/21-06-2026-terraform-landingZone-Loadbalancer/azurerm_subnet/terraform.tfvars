subnets = {
  subnet1 = {

    name                 = "Frontend-subnet"
    resource_group_name  = "nayanrg21"
    virtual_network_name = "nayanvnet21"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {

    name                 = "AzureBastionSubnet"
    resource_group_name  = "nayanrg21"
    virtual_network_name = "nayanvnet21"
    address_prefixes     = ["10.0.1.0/27"]
  }
}