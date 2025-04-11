
# Azure Resource Group Name
variable "jenrgname1" {
  type = string
  description = "This variable defines the Resource Group"
  default = "tstjenkdeprg01"
}

variable "jenrgname2" {
  type = string
  description = "created using jenkins file from repo"
  default = "tstjenkdeprg02"
}

# Azure Location
variable "location" {
  type = string
  description = "Azure Region where all these resources will be provisioned"
  default = "north europe"
}


