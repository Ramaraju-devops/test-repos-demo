# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "cloushell-rg"
    storage_account_name = "clousshellauto123"
    container_name = "tfcontainerjan24"
    key = "tsttfjan24.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # subscription_id = ""
  # tenant_id = ""
  # client_id = ""
  # client_secret = ""
}


