resource "azurerm_public_ip" "node" {
    name                         = "node-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "node-46336178796811301223006683"
}
