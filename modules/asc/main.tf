
resource "azurerm_spring_cloud_service" "sc" {
  name                = var.sc_service_name
  resource_group_name = var.resource_group_name
  location            = var.location

  network {
    app_subnet_id             = var.app_subnet_id
    service_runtime_subnet_id = var.service_runtime_subnet_id
    cidr_ranges               = var.sc_cidr
  }

  config_server_git_setting {
    uri          = "https://github.com/blitznihar/ascnextgenconfig"
    label        = "config"
    search_paths = ["dir1", "dir2"]
  }

  trace {
    connection_string = var.application_insights_connection_string
    sample_rate       = 10.0
  }

  timeouts {
    create = "60m"
    delete = "2h"
  }


}

resource "azurerm_monitor_diagnostic_setting" "sc_diag" {
  name                       = "monitoring"
  target_resource_id         = azurerm_spring_cloud_service.sc.id
  log_analytics_workspace_id = var.sc_law_id

  log {
    category = "ApplicationConsole"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}