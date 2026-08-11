output "id" {
  value = azurerm_service_plan.asp.id
}

output "function_app_id" {
  value = azurerm_windows_function_app.func.id
}
