resource "azurerm_virtual_machine" "mysql" {
  name                  = "${terraform.workspace}-mysql-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.mysql.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-mysql-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-mysql-vm"
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
		private_key = file(pathexpand("~/.ssh/id_rsa"))
		host = azurerm_public_ip.mysql.fqdn
  }
provisioner "remote-exec" {
	  inline = [
		"sudo apt update",
		"sudo apt install -y mysql-server",
		"sudo service mysql stop",
		"sudo mkdir -p /var/run/mysqld",
		"sudo chown mysql:mysql /var/run/mysqld",
		"sudo /usr/sbin/mysqld --skip-grant-tables --skip-networking &",
		"mysql -u root",
		"FLUSH PRIVILEGES;",
		"use mysql;",
		"UPDATE user SET authentication_string=PASSWORD('root') WHERE User='root';",
		"UPDATE user SET plugin='mysql_native_password' WHERE User='root';",
		"quit",
		"sudo pkill mysqld",
		"sudo service mysql start"
	  ]
  }
}

