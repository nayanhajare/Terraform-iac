vnets = {
  vnet1 = {
    name                = "nayanvnet1"
    location            = "centralindia"
    resource_group_name = "nayanrg1"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "nayanvnet2"
    location            = "centralindia"
    resource_group_name = "nayanrg1"
    address_space       = ["10.1.0.0/16"]
  }
}