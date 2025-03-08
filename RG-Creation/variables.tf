
# Azure Resource Group Name
variable "jenrgname" {
  type = string
  description = "This variable defines the Resource Group"
  default = "tstjenkdeprg01"
}

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "north europe"
}


