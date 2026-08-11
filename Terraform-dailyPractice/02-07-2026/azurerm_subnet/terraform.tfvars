subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    virtual_network_name = "nayanvnet1"
    resource_group_name  = "nayanrg1"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "nayanvnet1"
    resource_group_name  = "nayanrg1"
    address_prefixes     = ["10.0.1.0/26"]
  }

}