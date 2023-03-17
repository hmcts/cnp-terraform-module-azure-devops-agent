variable "resource_group_name" {
  type        = string
  description = "[REQUIRED] - resource group to store resources"
}

variable "location" {
  type        = string
  description = "[REQUIRED] - location to store resources"
}

variable "tags" {
  type        = map(string)
  description = "[REQUIRED] - azure tags"
}

variable "vnet_name" {
  type        = string
  description = "[REQUIRED] - location to store resources"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "[REQUIRED] - address space to be used by the virtual network"
}

variable "dns_servers" {
  type        = list(string)
  description = "dns servers for virtual network"
  default     = []
}

variable "subnet_name" {
  type        = string
  description = "[REQUIRED] - name given to subnet"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "[REQUIRED] - name given to subnet"
}

variable "service_endpoints" {
  type        = list(string)
  description = "list of service endpoints assigned to subnet"
  default     = []
}

variable "peering_client_id" {
  type        = string
  description = "[REQUIRED] - client id with peering access"
}

variable "peering_client_secret" {
  type        = string
  description = "[REQUIRED] - client id with peering access"
}

variable "dns_zones" {
  type        = list(string)
  description = "list of private dns zones to link to virtual network"
  default     = []
}

variable "key_vault_name" {
  type        = string
  description = "[REQUIRED] - name given to key vault"
}

variable "route_table_name" {
  type        = string
  description = "[REQUIRED] - name given to route table"
}

variable "vmss_name" {
  type        = string
  description = "[REQUIRED] - name given to virtual machine scale set"
}

variable "vmss_sku" {
  type        = string
  description = "sku for virtual machine scale set"
  default     = "Standard_D4s_v4"
}

variable "vmss_instance_count" {
  type        = number
  description = "virtual machine scale set instance count (usually managed via Azure DevOps)"
  default     = 1
}

variable "vmss_admin_username" {
  type        = string
  description = "username for admin account on virtual machine scale set"
  default     = "adoagent"
}

variable "vmss_source_image_id" {
  type        = string
  description = "the id of an image which the virtual machine scale set should be based on"
  default     = null
}

variable "nsg_name" {
  type        = string
  description = "name given to the nsg"
}