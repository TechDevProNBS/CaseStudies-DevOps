resource "azurerm_subnet" "front" {
  name                 = "front-net"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.virtual_network.name
  address_prefix       = "10.10.1.0/24"
}
