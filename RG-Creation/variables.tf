
# Azure Resource Group Name
variable "rgname" {
  type = string
  description = "This variable defines the Resource Group"
  default = "demogithubjenkinsrg1"
}

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "north europe"
}


