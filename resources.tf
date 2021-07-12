# Afim de efetuar uma separação por função de cada arquivo, criamos esse resource
# onde ficara somente os codigos referentes a criação de recursos.

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_private_dns_zone" "dns_zone_private" {
  count               = length(var.dns_zone_private_name)
  name                = var.dns_zone_private_name[count.index]
  resource_group_name = azurerm_resource_group.rg.name
}