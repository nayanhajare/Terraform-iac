subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    virtual_network_name = "hajare-vnet1"
    resource_group_name  = "hajare-rg1"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet"
    virtual_network_name = "hajare-vnet2"
    resource_group_name  = "hajare-rg1"
    address_prefixes     = ["10.1.0.0/24"]
  }
}