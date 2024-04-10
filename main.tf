# We first specify the terraform provider. 
# Terraform will use the provider to ensure that we can work with Microsoft Azure

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
}

# Here we need to mention the Azure AD Application Object credentials to allow us to work with 
# our Azure account

provider "azurerm" {
  subscription_id = "afe50e4c-141c-4971-8601-917c6a4da438"
  client_id       = "cdcb390c-687c-4ec9-93ff-873d8665e018"
  client_secret  = "dfgdfgsdsdfsdfd"
  tenant_id       = "b9cae6db-1e49-4e86-a3f2-9db6db29a985"
  features {}
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
