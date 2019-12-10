resource "azurerm_subnet" "mysql" {
  name                 = "mysql-net"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.virtual_network.name
  address_prefix       = "10.10.3.0/24"
}
