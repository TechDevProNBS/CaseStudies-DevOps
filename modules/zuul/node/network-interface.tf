resource "azurerm_network_interface" "node" {
  name                = "${terraform.workspace}-node-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.node.id


  ip_configuration {
    name                          = "${terraform.workspace}-node"
    subnet_id                     = azurerm_subnet.back.id
    private_ip_address_allocation = "Dynamic"
  }
}

