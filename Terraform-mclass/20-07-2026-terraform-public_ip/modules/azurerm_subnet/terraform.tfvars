subnets = {
    subnet1 ={
         name = "frontend-subnet"
  virtual_network_name = "nayanvnet"
  resource_group_name = "nayanrg"
  address_prefixes = ["10.0.0.0/24"]
    }
    subnet2 ={
         name = "backend-subnet"
  virtual_network_name = "nayanvnet"
  resource_group_name = "nayanrg"
  address_prefixes = ["10.0.1.0/24"]
    }
}