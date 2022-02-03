resource "azurerm_application_insights" "azurerm_application_insights_ng" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}