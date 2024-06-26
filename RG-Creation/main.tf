
# 1. Terraform Settings Block
terraform {
  # 1. Required Version Terraform
  required_version = ">= 0.13"
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
   
  }

# Terraform State Storage to Azure Storage Container

  backend "azurerm" {
    resource_group_name   = "github-tfstates-rg"
    storage_account_name  = "stracctgithubterr01"
    container_name        = "tfstatecontainer"
    key                   = "jenkinspipe.tfstate"
  } 
}


# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {}
   client_id = "5eaded78-69b1-4513-8de9-cac216967684"
   client_secret = "NpJ8Q~yvTYkZrUdAnKv85OOr_GiOfshXq3zFDa0N"
   tenant_id = "84f96efe-d3ca-47a5-bc04-8d455c1e0e15"
   subscription_id = "13917d14-a7e0-4435-8830-403a28246744" 
}

