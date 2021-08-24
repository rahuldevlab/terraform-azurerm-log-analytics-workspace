output "id" {
  value       = azurerm_log_analytics_workspace.self.id
  description = "The Log Analytics Workspace ID."
}

output "name" {
  value       = azurerm_log_analytics_workspace.self.name
  description = "The Log Analytics Workspace name."
}

output "primary_shared_key" {
  value       = azurerm_log_analytics_workspace.self.primary_shared_key
  description = "The Primary shared key for the Log Analytics Workspace."
}

output "secondary_shared_key" {
  value       = azurerm_log_analytics_workspace.self.secondary_shared_key
  description = "The Secondary shared key for the Log Analytics Workspace."
}

output "workspace_id" {
  value       = azurerm_log_analytics_workspace.self.workspace_id
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
}
