
# 1. Terraform Settings Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.19.0"
    }
  }
  backend "azurerm" {}
}

# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {}
   subscription_id = "13917d14-a7e0-4435-8830-403a28246744"
   tenant_id = "84f96efe-d3ca-47a5-bc04-8d455c1e0e15"
   client_id = "7a6ff7d1-7f27-4fa9-8d0a-46b052bda94f"
}

