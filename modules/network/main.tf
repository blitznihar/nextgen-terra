resource "azurerm_network_security_group" "azurerm_network_security_group_app_sg" {
  name                = "nextgen-security-group_app"
  location            = var.azurerm_resource_group_ng_location
  resource_group_name = var.azurerm_resource_group_ng_name
}
resource "azurerm_network_security_group" "azurerm_network_security_group_service_runtime_sg" {
  name                = "nextgen-security-group_service_runtime"
  location            = var.azurerm_resource_group_ng_location
  resource_group_name = var.azurerm_resource_group_ng_name
}
resource "azurerm_virtual_network" "azurerm_virtual_vnet" {
  name                = "nextgen-network"
  location            = var.azurerm_resource_group_ng_location
  resource_group_name = var.azurerm_resource_group_ng_name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Production"
  }
}
resource "azurerm_subnet" "azurerm_service_runtime_subnet" {
  name                 = "service_runtime_subnet"
  resource_group_name  = var.azurerm_resource_group_ng_name
  virtual_network_name = azurerm_virtual_network.azurerm_virtual_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_subnet" "azurerm_app_subnet" {
  name                 = "app_subnet"
  resource_group_name  = var.azurerm_resource_group_ng_name
  virtual_network_name = azurerm_virtual_network.azurerm_virtual_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
/*
az role assignment create \
    --role "Owner" \
    --scope ${VIRTUAL_NETWORK_RESOURCE_ID} \
    --assignee e8de9221-a19c-4c81-b814-fd37c6caf9d2
*/
resource "azurerm_role_assignment" "example" {
  scope                = azurerm_virtual_network.azurerm_virtual_vnet.id
  role_definition_name = "Owner"
  principal_id         = "1bc58f97-7180-4ebb-a057-88c8f727b590"
}