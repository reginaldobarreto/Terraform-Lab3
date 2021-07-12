# Saída de arquivo é onde você define que tipo considerar isso é um cérebro das funções, 
# assim escolhendo o nome de saida do recurso independente do idioma

output "grupo_de_recurso" {
  value = azurerm_resource_group.rg.id
}

output "dns_privado" {
  # [for temp in list : output]
  value = [for bar in var.dns_zone_private_name : upper(bar)]
}

output "network_security_group" {
  value = azurerm_network_security_group.nsg.id
}