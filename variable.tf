#Aqui configuramos todas as nossas preferencias quanto a nome de recursos, bem como localização, etc
#Para usar dentro do arquivo resources.tf chamamos da seguinte forma "var.nome_da_variavel"

variable "resource_group_name" {
  default = "RG-Terraform-Lab1"
}

variable "location" {
  default = "East US"
}

variable "dns_zone_private_name" {
  type = list(string)
}

variable "network_security_group_name" {
  default = "nsgbarreto"
}

variable "nsgrules" {
  type = any
}