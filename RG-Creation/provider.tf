
# 1. Terraform Settings Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.9.0"
    }
  }
  backend "azurerm" {}
}

# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {}
}

