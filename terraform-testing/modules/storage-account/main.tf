resource "azurerm_storage_account" "str-acct" {
  name                     = "${var.stracctname}"
  resource_group_name      = "${var.rgname}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "testing"
    owner = "rama"
    test = "terraform"
  }
}