resource "azurerm_network_interface" "nginx" {
  name                = "${var.prefix}-nginx-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.nginx.id}"


  ip_configuration {
    name                          = "nginx"
    subnet_id                     = "${azurerm_subnet.nginx.id}"
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.nginx.id}"
  }
}

resource "azurerm_network_interface" "node.js" {
  name                = "${var.prefix}-node.js-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.node.js.id}"


  ip_configuration {
    name                          = "node.js"
    subnet_id                     = "${azurerm_subnet.node.js.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "springboot" {
  name                = "${var.prefix}-springboot-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.springboot.id}"


  ip_configuration {
    name                          = "springboot"
    subnet_id                     = "${azurerm_subnet.springboot.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "zuul" {
  name                = "${var.prefix}-zuul-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.zuul.id}"


  ip_configuration {
    name                          = "zuul"
    subnet_id                     = "${azurerm_subnet.zuul.id}"
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.zuul.id}"
  }
}

resource "azurerm_network_interface" "eureka" {
  name                = "${var.prefix}-eureka-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.eureka.id}"


  ip_configuration {
    name                          = "eureka"
    subnet_id                     = "${azurerm_subnet.eureka.id}"
    private_ip_address_allocation = "Dynamic"
  }

resource "azurerm_network_interface" "database" {
  name                = "${var.prefix}-database-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.database.id}"


  ip_configuration {
    name                          = "database"
    subnet_id                     = "${azurerm_subnet.database.id}"
    private_ip_address_allocation = "Dynamic"
  }

resource "azurerm_network_interface" "jenkins" {
  name                = "${var.prefix}-jenkins-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.jenkins.id}"


  ip_configuration {
    name                          = "jenkins"
    subnet_id                     = "${azurerm_subnet.jenkins.id}"
    private_ip_address_allocation = "Dynamic"
  }

}
resource "azurerm_network_interface" "apache" {
  name                = "${var.prefix}-apache-nic"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  network_security_group_id = "${azurerm_network_security_group.apache.id}"


  ip_configuration {
    name                          = "apache"
    subnet_id                     = "${azurerm_subnet.apache.id}"
    private_ip_address_allocation = "Dynamic"
  }

}




