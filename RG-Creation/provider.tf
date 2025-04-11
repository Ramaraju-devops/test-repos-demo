
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
}

