resource "azurerm_api_management" "azurerm_api_management_ng" {
  name                = var.apim_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  publisher_name      = "BLITZ NEXTGEN"
  publisher_email     = "blitznihar@gmail.com"

  sku_name = "Developer_1"

  config_server_git_setting {
    uri          = "https://github.com/blitznihar/apimnextgenconfig"
    label        = "config"
    search_paths = ["dir1", "dir2"]
  }

  trace {
    connection_string = var.application_insights
    sample_rate       = 10.0
  }


}

resource "azurerm_api_management_gateway" "azurerm_api_management_gateway_ng" {
  name              = "example-gateway"
  api_management_id = azurerm_api_management.azurerm_api_management_ng.id
  description       = "Example API Management gateway"

  location_data {
    name     = "example name"
    city     = "example city"
    district = "example district"
    region   = "example region"
  }
}
resource "azurerm_api_management_api" "azurerm_api_management_api_ng" {
  name                = "api-management-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.azurerm_api_management_ng.name
  revision            = "1"
  display_name        = "BLITZ API"
  path                = "blitz"
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = "http://conferenceapi.azurewebsites.net/?format=json"
  }
}

resource "azurerm_api_management_logger" "azurerm_api_management_logger_ng" {
  name                = "example-apimlogger"
  api_management_name = azurerm_api_management.azurerm_api_management_ng.name
  resource_group_name = var.resource_group_name

  application_insights {
    instrumentation_key = azurerm_application_insights.azurerm_application_insights_ng.instrumentation_key
  }
}

resource "azurerm_api_management_api_diagnostic" "example" {
  identifier               = "applicationinsights"
  resource_group_name      = var.resource_group_name
  api_management_name      = azurerm_api_management.azurerm_api_management_ng.name
  api_name                 = azurerm_api_management_api.azurerm_api_management_api_ng.name
  api_management_logger_id = azurerm_api_management_logger.azurerm_api_management_logger_ng.id

  sampling_percentage       = 5.0
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "verbose"
  http_correlation_protocol = "W3C"

  frontend_request {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "accept",
      "origin",
    ]
  }

  frontend_response {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "content-length",
      "origin",
    ]
  }

  backend_request {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "accept",
      "origin",
    ]
  }

  backend_response {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "content-length",
      "origin",
    ]
  }
}