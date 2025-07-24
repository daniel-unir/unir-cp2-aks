output "acr_url" {
  value       = azurerm_container_registry.acr-unir-casopractico2.login_server
  sensitive   = false
}
output "acr_user" {
  value       = azurerm_container_registry.acr-unir-casopractico2.admin_username
  sensitive   = false
}
output "acr_pwd" {
  value       = azurerm_container_registry.acr-unir-casopractico2.admin_password
  sensitive   = true
}
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks-unir-casopractico2.kube_config[0].client_certificate
  sensitive = true
}
output "kube_config" {
  value = azurerm_kubernetes_cluster.aks-unir-casopractico2.kube_config_raw
  sensitive = true
}
