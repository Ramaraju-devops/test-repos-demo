# Terraform Resource to Create Azure Resource Group with Input Variables defined in variables.tf
resource "azurerm_resource_group" "jenkindemorg1" {
  name =   "jenkdemorg1"
  location = "southindia"

  tags= {
     
      "Environment"   = "POC"
      "Owner"         = "Ramaraju"
      "Owner_Email"   = "ramaraju@gmail.com"
      "IteraplanID"   = "12345678"

  }
}

