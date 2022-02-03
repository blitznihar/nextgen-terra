output "azurerm_network_security_group_service_runtime_sg_name" {
  value = azurerm_network_security_group.azurerm_network_security_group_service_runtime_sg.name
}
output "azurerm_network_security_group_service_runtime_sg_id" {
  value = azurerm_network_security_group.azurerm_network_security_group_service_runtime_sg.id
}
output "azurerm_network_security_group_app_sg_name" {
  value = azurerm_network_security_group.azurerm_network_security_group_app_sg.name
}
output "azurerm_network_security_group_app_sg_id" {
  value = azurerm_network_security_group.azurerm_network_security_group_app_sg.id
}
output "azurerm_virtual_vnet_name" {
  value = azurerm_virtual_network.azurerm_virtual_vnet.name
}

output "azurerm_virtual_vnet_id" {
  value = azurerm_virtual_network.azurerm_virtual_vnet.id
}
output "app_subnet_id" {
  value = azurerm_subnet.azurerm_service_runtime_subnet.id
}
output "service_runtime_subnet_id" {
  value = azurerm_subnet.azurerm_app_subnet.id
}