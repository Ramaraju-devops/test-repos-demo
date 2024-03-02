resource "azurerm_resource_group" "demorg02" {
  name     = "${var.rgname02}"
  location = "${var.location}"

  tags = {
    environment = "testing"
    owner = "rama"
    test = "terraform"
  }
}

resource "azurerm_resource_group" "demorg03" {
  name     = "${var.rgname03}"
  location = "${var.location}"

  tags = {
    environment = "testing"
    owner = "rama"
    test = "terraform"
  } 
}

resource "azurerm_resource_group" "demoforeachrg" {
  for_each = toset( ["tstforeachrg01", "abcforeachrg01", "xyzforeachrg01"] )
  name     = each.key
  location = "${var.location}"
}


