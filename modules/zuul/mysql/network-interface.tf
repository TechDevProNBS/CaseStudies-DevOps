resource "azurerm_network_interface" "mysql" {
  name                = "${terraform.workspace}-mysql-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.mysql.id


  ip_configuration {
    name                          = "${terraform.workspace}-mysql"
    subnet_id                     = azurerm_subnet.database.id
    private_ip_address_allocation = "Dynamic"
  }
}

