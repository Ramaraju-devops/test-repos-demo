
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
}

