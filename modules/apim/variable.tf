variable "apim_service_name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "application_insights_instumentation_key" {
  type        = string
  description = "application insights instumentation key"
  default     = ""
}
