resource "azurerm_kubernetes_cluster" "aks-unir-casopractico2" {
  name                = "aks-unir-casopractico2"
  location            = azurerm_resource_group.rg-unir-casopractico2.location
  resource_group_name = azurerm_resource_group.rg-unir-casopractico2.name
  dns_prefix          = "aks-unir-casopractico2"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "casopractico2"
  }
}

resource "azurerm_role_assignment" "ra-unir-casopractico2" {
  principal_id                     = azurerm_kubernetes_cluster.aks-unir-casopractico2.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr-unir-casopractico2.id
  skip_service_principal_aad_check = true
}
