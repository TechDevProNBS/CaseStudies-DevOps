resource "azurerm_subnet" "front" {
  name                 = "front-net"
  resource_group_name  = "${azurerm_resource_group.default.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "10.10.1.0/24"
}
resource "azurerm_subnet" "jenkins" {
  name                 = "jenkins-net"
  resource_group_name  = "${azurerm_resource_group.default.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "10.10.3.0/24"
}
resource "azurerm_subnet" "back" {
  name                 = "back-net"
  resource_group_name  = "${azurerm_resource_group.default.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "10.10.2.0/24"
}
resource "azurerm_subnet" "database" {
  name                 = "database-net"
  resource_group_name  = "${azurerm_resource_group.default.name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "10.10.4.0/24"
}




