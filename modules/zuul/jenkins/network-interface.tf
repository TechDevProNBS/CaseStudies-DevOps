resource "azurerm_network_interface" "jenkins" {
  name                = "${terraform.workspace}-jenkins-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.jenkins.id


  ip_configuration {
    name                          = "${terraform.workspace}-jenkins"
    subnet_id                     = azurerm_subnet.jenkin.id
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.jenkins.id
  }
}

