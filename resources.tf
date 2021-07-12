# Afim de efetuar uma separação por função de cada arquivo, criamos esse resource
# onde ficara somente os codigos referentes a criação de recursos.

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create a private dns zone
resource "azurerm_private_dns_zone" "dns_zone_private" {
  count               = length(var.dns_zone_private_name)
  name                = var.dns_zone_private_name[count.index]
  resource_group_name = azurerm_resource_group.rg.name
}

# Create a network security group with rules
resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    iterator = buscador
    for_each = var.nsgrules
    content {

      name                       = buscador.value.name
      priority                   = buscador.value.priority
      direction                  = buscador.value.direction
      access                     = buscador.value.access
      protocol                   = buscador.value.protocol
      source_port_range          = buscador.value.source_port_range
      destination_port_range     = buscador.value.destination_port_range
      source_address_prefix      = buscador.value.source_address_prefix
      destination_address_prefix = buscador.value.destination_address_prefix
    }
  }

}