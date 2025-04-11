
# 1. Terraform Settings Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.10.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "github-tfstates-rg"
    storage_account_name = "stracctgithubterr01"
    container_name       = "abccontainer"
    key                  = "jenk-test2.tfstate"
  }
}
# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {}
}

