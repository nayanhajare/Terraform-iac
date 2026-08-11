vnet_peering = {
  vnetpeering1 = {
    name                         = "vnet1to2"
    virtual_network_name         = "hajare-vnet1"
    resource_group_name          = "hajare-rg1"
    remote_virtual_network_id    = "/subscriptions/73950bf5-1ded-4cff-91b1-9f18babff8b7/resourceGroups/hajare-rg1/providers/Microsoft.Network/virtualNetworks/hajare-vnet2"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
  vnetpeering2 = {
    name                         = "vnet2to1"
    virtual_network_name         = "hajare-vnet2"
    resource_group_name          = "hajare-rg1"
    remote_virtual_network_id   = "/subscriptions/73950bf5-1ded-4cff-91b1-9f18babff8b7/resourceGroups/hajare-rg1/providers/Microsoft.Network/virtualNetworks/hajare-vnet1"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}