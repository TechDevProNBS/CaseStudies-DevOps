terraform {
  backend "azurerm" {
    storage_account_name  = var.storage_account_name
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
	version = "=1.30.1"
}

module "nginx" {
  source          = "./modules/nginx"
  admin_user      = "sam"
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "jenkins" {
  source          = "./modules/jenkins"
  admin_user      = "sam"
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "mysql" {
  source          = "./modules/mysql"
  admin_user      = "sam"
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "zuul" {
  source          = "./modules/zuul"
  admin_user      = "sam"
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "eureka" {
  source          = "./modules/eureka"
  admin_user      = "sam"
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "springboot" {
  source          = "./modules/springboot"
  admin_user      = "sam"
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

module "node" {
  source          = "./modules/node"
  admin_user      = "sam"
  resource_group  = azurerm_resource_group.default
  virtual_network = azurerm_virtual_network.default
}

resource "azurerm_resource_group" "default" {
  name     = terraform.workspace
  location = "uksouth"
}

resource "azurerm_virtual_network" "default" {
  name                = "${terraform.workspace}-network"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
}

