resource "azurerm_network_interface" "zuul" {
  name                = "${terraform.workspace}-zuul-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.zuul.id

  ip_configuration {
    name                          = "${terraform.workspace}-zuul"
    subnet_id                     = azurerm_subnet.back.id
    private_ip_address_allocation = "Dynamic"
  }
}

