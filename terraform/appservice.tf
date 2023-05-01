resource "azurerm_service_plan" "app_service" {
  name                = "app-service"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = "app-rep-git"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.app_service.id


  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
}

  site_config {
    always_on = true

  application_stack {
      docker_image     = "damirojr/devopslab"
      docker_image_tag = "latest"
    }
  }

}
   


