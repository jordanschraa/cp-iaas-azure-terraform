#Management NSG
resource "azurerm_network_security_group" "cp-mgmt-nsg" {
  depends_on=[azurerm_resource_group.cp-mgmt-rg]
  name = "cp-mgmt-nsg"
  location            = azurerm_resource_group.cp-mgmt-rg.location
  resource_group_name = azurerm_resource_group.cp-mgmt-rg.name
  security_rule {
    name                       = "SSH"
    description                = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "GAiA-portal"
    description                = "GAiA-portal"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
   security_rule {
    name                       = "SmartConsole-1"
    description                = "SmartConsole-1"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "18190"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "SmartConsole-2"
    description                = "SmartConsole-2"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "19009"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "Logs"
    description                = "Logs"
    priority                   = 140
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "257"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "ICA-pull"
    description                = "ICA-pull"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "18210"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    name                       = "CRL-fetch"
    description                = "CRL-fetch"
    priority                   = 160
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "18191"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = var.environment
  }
}




#Gateway NSG
resource "azurerm_network_security_group" "cp-gw-nsg" {
  depends_on=[azurerm_resource_group.cp-gw-rg]
  name = "cp-gw-nsg"
  location            = azurerm_resource_group.cp-gw-rg.location
  resource_group_name = azurerm_resource_group.cp-gw-rg.name
  security_rule {
    name                       = "Any"
    description                = "Any"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.environment
  }
}



#VM NSG
resource "azurerm_network_security_group" "cp-vm-nsg" {
  depends_on=[azurerm_resource_group.cp-vm-rg]
  name = "cp-vm-nsg"
  location            = azurerm_resource_group.cp-vm-rg.location
  resource_group_name = azurerm_resource_group.cp-vm-rg.name
  security_rule {
    name                       = "allow-ssh"
    description                = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow-http"
    description                = "allow-http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  tags = {
    environment = var.environment
  }
}