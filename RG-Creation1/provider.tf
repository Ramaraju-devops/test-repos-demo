
# 1. Terraform Settings Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.9.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "github-tfstates-rg"
    storage_account_name = "stracctgithubterr01"
    container_name       = "abccontainer"
    key                  = "jenk-test1.tfstate"
  }
}
# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {}
}

