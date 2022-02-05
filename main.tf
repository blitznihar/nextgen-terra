# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "resource" {
  source = "./modules/resource"
}

module "network" {
  source                             = "./modules/network"
  azurerm_resource_group_ng_id       = module.resource.azurerm_resource_group_ng_id
  azurerm_resource_group_ng_name     = module.resource.azurerm_resource_group_ng_name
  azurerm_resource_group_ng_location = module.resource.azurerm_resource_group_ng_location
}

module "insight" {
  source              = "./modules/insight"
  app_insights_name   = "insight20220130"
  location            = module.resource.azurerm_resource_group_ng_location
  resource_group_name = module.resource.azurerm_resource_group_ng_name
}

module "loganalyticsworkspace" {
  source              = "./modules/law"
  law_service_name    = "law_ng"
  location            = module.resource.azurerm_resource_group_ng_location
  resource_group_name = module.resource.azurerm_resource_group_ng_name
}

module "asc" {
  source                                 = "./modules/asc"
  sc_service_name                        = "asc-ng27318712357356187"
  location                               = module.resource.azurerm_resource_group_ng_location
  resource_group_name                    = module.resource.azurerm_resource_group_ng_name
  sc_law_id                              = module.loganalyticsworkspace.azurerm_log_analytics_workspace_ng_id
  app_subnet_id                          = module.network.app_subnet_id
  service_runtime_subnet_id              = module.network.service_runtime_subnet_id
  application_insights_connection_string = module.insight.application_insights_connection_string
}

module "apim" {
  source                                  = "./modules/apim"
  apim_service_name                       = "apim-ng27318712357356187"
  location                                = module.resource.azurerm_resource_group_ng_location
  resource_group_name                     = module.resource.azurerm_resource_group_ng_name
  application_insights_instumentation_key = module.insight.application_insights_instumentation_key
}

module "asb" {
  source              = "./modules/asb"
  asb_service_name     = "asb-ng27318712357356187"
  location            = module.resource.azurerm_resource_group_ng_location
  resource_group_name = module.resource.azurerm_resource_group_ng_name
}