output "azurerm_application_insights_ng_name" {
  value = azurerm_application_insights.azurerm_application_insights_ng.name
}
output "azurerm_application_insights_ng_id" {
  value = azurerm_application_insights.azurerm_application_insights_ng.id
}
output "var.application_insights_connection_string" {
  value = azurerm_application_insights.azurerm_application_insights_ng.connection_string
}
output "var.application_insights_instumentation_key" {
  value = azurerm_application_insights.azurerm_application_insights_ng.instrumentation_key
}