vnets = {
  vnet1 = {

    name                = "nayan-vnet"
    location            = "centralindia"
    resource_group_name = "nayan-rg"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {

    name                = "nayan-vnet1"
    location            = "centralindia"
    resource_group_name = "nayan-rg"
    address_space       = ["10.1.0.0/16"]
  }
}