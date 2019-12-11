resource "azurerm_network_interface" "eureka" {
  name                = "${terraform.workspace}-eureka-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.eureka.id


  ip_configuration {
    name                          = "${terraform.workspace}-eureka"
    subnet_id                     = azurerm_subnet.back.id
    private_ip_address_allocation = "Dynamic"
  }
}

