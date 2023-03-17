variable "resource_group_name" {
  type        = string
  description = "resource group to store resources"
}

variable "location" {
  type        = string
  description = "location to store resources"
}

variable "tags" {
  type        = map(string)
  description = "azure tags"
}

variable "vnet_name" {
  type        = string
  description = "location to store resources"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "address space to be used by the virtual network"
}

variable "dns_servers" {
  type        = list(string)
  description = "dns servers for virtual network"
  default     = []
}

variable "subnet_name" {
  type        = string
  description = "name given to subnet"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "name given to subnet"
}

variable "peering_client_id" {
  type        = string
  description = "client id with peering access"
}

variable "peering_client_secret" {
  type        = string
  description = "client id with peering access"
}

variable "dns_zones" {
  type        = list(string)
  description = "list of dns zones to link to virtual network"
}

variable "key_vault_name" {
  type        = string
  description = "name given to key vault"
}