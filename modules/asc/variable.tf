variable "sc_service_name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "sc_cidr" {
  type        = list(any)
  description = "CIDR Ranges from your Virtual network to be used by Azure Spring Cloud(e.g XX.X.X.X/16,XX.X.X.X/16,XX.X.X.X/16)"
  default     = ["10.3.0.0/16", "10.4.0.0/16", "10.5.0.1/16"]
}

variable "sc_law_id" {
  type        = string
  description = "Name of the Azure Log Analytics workspace to be used for storing diagnostic logs(e.g la-cb5sqq6574o2a)"
  default     = ""
}
variable "vnet_spoke_name" {
  type        = string
  description = "Name of the Spoke Virtual Network name(e.g. vnet-spoke)"
  default     = ""
}
variable "app_subnet_id" {
  type        = string
  description = "Name of the SubNet to be used by Spring Cloud App Service (e.g snet-app)"
  default     = ""
}
variable "service_runtime_subnet_id" {
  type        = string
  description = "Name of the SubNet to be used by Spring Cloud runtime Service (e.g snet-runtime)"
  default     = ""
}

variable "application_insights_connection_string" {
  type        = string
  description = "application insights connection string"
  default     = ""
}