resource "azurerm_storage_account" "stracct01" {
  name                     = "${var.stracctname01}"
  resource_group_name      = "${azurerm_resource_group.demorg02.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"


  tags = {
    environment = "testing"
    owner = "rama"
    test = "terraform"
  }
}

resource "azurerm_storage_account" "stracct02" {
  name                     = "${var.stracctname02}"
  resource_group_name      = "${data.azurerm_resource_group.tstrg01.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "testing"
    owner = "rama"
    test = "terraform"
  }
}

module "stracctabc" {
    source = "./modules/storage-account"
    stracctname = "tststactflcmod01"
    location = "${var.location}"
    rgname = "${var.rgname03}"
}



resource "azurerm_storage_account" "stracctcount01" {
  count = 4
  name                     = "stractlccntabc0${count.index+1}"
  resource_group_name      = "${azurerm_resource_group.demorg03.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "testing"
    owner = "rama"
    test = "terraform"
  }
}