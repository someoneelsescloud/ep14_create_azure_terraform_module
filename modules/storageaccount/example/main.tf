locals {
  assetname   = "max"
  environment = "example"
  location    = "westus"

  resource_name = format("%s-%s-%s", local.assetname, local.environment, local.location)
}

resource "azurerm_resource_group" "resourcegroup" {
  name     = "${local.resource_name}-rg-1"
  location = local.location
}

module "storageaccount" {

  source = "../"

  instance_count          = 1
  resource_group_name     = azurerm_resource_group.resourcegroup.name
  resource_group_location = azurerm_resource_group.resourcegroup.location
  assetname               = local.assetname
  environment             = local.environment

}