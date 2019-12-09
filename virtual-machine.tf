resource "azurerm_virtual_machine" "front" {
  name                  = "${var.prefix}-front-vm"
  location              = "${azurerm_resource_group.default.location}"
  resource_group_name   = "${azurerm_resource_group.default.name}"
  network_interface_ids = ["${azurerm_network_interface.front.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}-front-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prefix}-front-vm"
    admin_username = "${var.admin_user}"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/${var.admin_user}/.ssh/authorized_keys"
	key_data = "${file("/home/${var.admin_user}/.ssh/id_rsa.pub")}"
	}
  }
  tags = {
    environment = "staging"
  }
	connection {
		type = "ssh"
		user = "${var.admin_user}"
		private_key = file("/home/${var.admin_user}/.ssh/id_rsa")
		host = "${azurerm_public_ip.front.fqdn}"
  }
  provisioner "remote-exec" {
	  inline = [
		  "sudo apt update",
		  "sudo apt install -y nginx",
      "sudo systemctl enable --now nginx"
	  ]
  } 
}

resource "azurerm_virtual_machine" "back" {
  name                  = "${var.prefix}-back-vm"
  location              = "${azurerm_resource_group.default.location}"
  resource_group_name   = "${azurerm_resource_group.default.name}"
  network_interface_ids = ["${azurerm_network_interface.back.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}-back-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prefix}-back-vm"
    admin_username = "${var.admin_user}"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path = "/home/${var.admin_user}/.ssh/authorized_keys"
        key_data = "${file("/home/${var.admin_user}/.ssh/id_rsa.pub")}"
        }
  }
  tags = {
    environment = "staging"
  }
 
}

resource "azurerm_virtual_machine" "jenkins" {
  name                  = "${var.prefix}-jenkins-vm"
  location              = "${azurerm_resource_group.default.location}"
  resource_group_name   = "${azurerm_resource_group.default.name}"
  network_interface_ids = ["${azurerm_network_interface.jenkins.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}-jenkins-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prefix}-jenkins-vm"
    admin_username = "${var.admin_user}"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path = "/home/${var.admin_user}/.ssh/authorized_keys"
        key_data = "${file("/home/${var.admin_user}/.ssh/id_rsa.pub")}"
        }
  }
  tags = {
    environment = "staging"
  }
        connection {
                type = "ssh"
                user = "${var.admin_user}"
                private_key = file("/home/${var.admin_user}/.ssh/id_rsa")
                host = "${azurerm_public_ip.jenkins.fqdn}"
  }
}

resource "azurerm_virtual_machine" "database" {
  name                  = "${var.prefix}-database-vm"
  location              = "${azurerm_resource_group.default.location}"
  resource_group_name   = "${azurerm_resource_group.default.name}"
  network_interface_ids = ["${azurerm_network_interface.database.id}"]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}-database-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.prefix}-database-vm"
    admin_username = "${var.admin_user}"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path = "/home/${var.admin_user}/.ssh/authorized_keys"
        key_data = "${file("/home/${var.admin_user}/.ssh/id_rsa.pub")}"
        }
  }
  tags = {
    environment = "staging"
  }

}





