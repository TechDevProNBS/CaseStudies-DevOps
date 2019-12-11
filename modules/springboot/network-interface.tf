resource "azurerm_network_interface" "springboot" {
  name                = "${terraform.workspace}-springboot-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.springboot.id


  ip_configuration {
    name                          = "${terraform.workspace}-springboot"
    subnet_id                     = azurerm_subnet.back.id
    private_ip_address_allocation = "Dynamic"
  }
}

