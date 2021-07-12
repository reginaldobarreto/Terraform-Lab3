#Usado para alimentar e sobrepor os valores das variáveis setadas no arquivo variable.tf 
#Util quando os valores das variaveis partir de uma fonte diferente.

resource_group_name         = "RG-Terraform-Lab3"
location                    = "Brazil South"
dns_zone_private_name       = ["barreto.local", "barrsoft.local", "developers.dev", "gambiarra.lan"]
network_security_group_name = "nsg-barreto"
nsgrules = [
  {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  ,
  {
    name                       = "rule2"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  ,
  {
    name                       = "rule3"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3406"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

]