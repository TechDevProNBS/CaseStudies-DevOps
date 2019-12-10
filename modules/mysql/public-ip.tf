resource "azurerm_public_ip" "mysql" {
    name                         = "mysql-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "mysql-46336178796811301223006683"
}
