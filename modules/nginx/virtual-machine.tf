resource "azurerm_virtual_machine" "nginx" {
  name                  = "${terraform.workspace}-nginx-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.nginx.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-nginx-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-nginx-vm"
    admin_username = var.admin_user
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/${var.admin_user}/.ssh/authorized_keys"
	key_data = file(pathexpand("~/.ssh/id_rsa.pub"))
	}
  }
  tags = {
    environment = "staging"
  }
	connection {
		type = "ssh"
		user = var.admin_user
		private_key = file(pathexpand("~/.ssh/id_rsa.pub"))
		host = azurerm_public_ip.nginx.fqdn
  }
  provisioner "remote-exec" {
	  inline = [
		  "sudo apt update",
		  "sudo apt install -y nginx",
      "sudo systemctl enable --now nginx"
	  ]
  } 
}

resource "azurerm_virtual_machine" "apache" {
  name                  = "${terraform.workspace}-apache-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.apache.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-apache-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-apache-vm"
    admin_username = var.admin_user
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/${var.admin_user}/.ssh/authorized_keys"
	key_data = file(pathexpand("~/.ssh/id_rsa.pub"))
	}
  }
  tags = {
    environment = "staging"
  }
	connection {
		type = "ssh"
		user = var.admin_user
		private_key = file(pathexpand("~/.ssh/id_rsa.pub"))
		host = azurerm_public_ip.nginx.fqdn
  }
}
