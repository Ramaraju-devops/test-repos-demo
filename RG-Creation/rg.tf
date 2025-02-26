# Terraform Resource to Create Azure Resource Group with Input Variables defined in variables.tf
resource "azurerm_resource_group" "jenkin-test-rg1" {
  name =   var.rgname
  location = var.location

  tags= {
     
      "Environment"   = "POC"
      "Owner"         = "Ramaraju"
      "Owner_Email"   = "ramaraju@gmail.com"
      "IteraplanID"   = "12345678"

  }
}
