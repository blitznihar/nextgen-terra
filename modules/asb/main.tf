resource "azurerm_servicebus_namespace" "azurerm_servicebus_namespace_ng" {
  name                = var.asb_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"

  tags = {
    source = "nextgen asb"
  }
}