resource "azurerm_network_security_group" "node" {
    name                = "${terraform.workspace}-node-nsg"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name
    
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "213.165.146.130"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "node"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "4500"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}
