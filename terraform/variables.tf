variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "doctor-app-rg"
}

variable "location" {
  description = "Azure region"
  default     = "eastus"
}

variable "environment" {
  description = "Environment name"
  default     = "dev"
}

variable "aks_node_count" {
  description = "Number of AKS worker nodes"
  default     = 1
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  default     = "Standard_B2s"
}
