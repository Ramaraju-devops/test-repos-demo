
# Azure Resource Group Name
variable "rgname" {
  type = string
  description = "This variable defines the Resource Group"
  default = "test-github-jenkin-rg"
}

# Azure Resource Group Name
variable "rgname1" {
  type = string
  description = "This variable defines the Resource Group"
  default = "test-github-jenkin-rg1"
}

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "west europe"
}


