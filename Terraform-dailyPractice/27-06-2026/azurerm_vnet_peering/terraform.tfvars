vnetpeering = {
  vnet1 = {
    name                      = "vnet1to2"
    resource_group_name       = "nayan-rg"
    virtual_network_name      = "nayan-vnet"
    remote_virtual_network_id = "/subscriptions/7ad7aecf-c069-440e-8f3b-e0894a950176/resourceGroups/nayan-rg/providers/Microsoft.Network/virtualNetworks/nayan-vnet1/"
  }
  vnet2 = {
    name                      = "vnet2to1"
    resource_group_name       = "nayan-rg"
    virtual_network_name      = "nayan-vnet1"
    remote_virtual_network_id = "/subscriptions/7ad7aecf-c069-440e-8f3b-e0894a950176/resourceGroups/nayan-rg/providers/Microsoft.Network/virtualNetworks/nayan-vnet/"
  }
}