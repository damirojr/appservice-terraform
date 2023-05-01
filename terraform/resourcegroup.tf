resource "azurerm_resource_group" "rg" {
  name     = "RG-LAB-APPSERVICE"
  location = var.location

}