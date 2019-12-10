resource "azurerm_public_ip" "nginx" {
    name                         = "${terraform.workspace}-nginx-pip"
    location                     = azurerm_resource_group.location
    resource_group_name          = azurerm_resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "${terraform.workspace}-nginx-4633616811301223006683"
}

