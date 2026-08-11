subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    virtual_network_name = "nayan-vnet"
    resource_group_name  = "nayan-rg"
    address_prefixes     = ["10.0.0.0/24"]
  }
  subnet2 = {
     name = "public-subnet"
    virtual_network_name = "nayan-vnet"
    resource_group_name  = "nayan-rg"
  address_prefixes = ["10.0.1.0/24"]
   }
}