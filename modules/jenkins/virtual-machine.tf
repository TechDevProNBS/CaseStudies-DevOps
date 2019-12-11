resource "azurerm_virtual_machine" "jenkins" {
  name                  = "${terraform.workspace}-jenkins-vm"
  location              = var.resource_group.location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.jenkins.id]
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${terraform.workspace}-jenkins-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${terraform.workspace}-jenkins-vm"
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
		host = azurerm_public_ip.jenkins.fqdn
  }
  provisioner "remote-exec" {
	  inline = [
		  "sudo apt update",
		   "while ps -aef | grep -v grep | grep apt; do echo 'waiting for apt lock' sleep 1; done",
      "sudo apt install -y python3 python3-pip",
      "mkdir -p ~/.local/bin",
      "echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc",
      "pip3 install --user ansible"
	  ]
  } 
}

