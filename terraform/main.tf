provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "mystore1"
    container_name       = "mycontainer1"
    key                  = "terraform.tfstate"
    access_key           = "QSUXWLcnNTWhyyCf93Kh2LFzElea3os2c+WBw7e6oxEraLnDL+H2zbrgFak6ATemT44SyN+bQ+B7+AStSPI1zw=="
  }
}
module "resource_group" {
  source               = "./modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
module "network" {
  source               = "./modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = "${module.resource_group.resource_group_name}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "./modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = "${module.resource_group.resource_group_name}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
  source           = "./modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "publicip" {
  source           = "./modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "publicip"
  resource_group   = "${module.resource_group.resource_group_name}"
}

module "Lvm" {
  source           = "./modules/vm"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "Lvm"
  #resource_group   = "${module.resource_group.resource_group_name}"
  resource_group = "${var.resource_group}"
  admin_username   = "odl_user_208292"
  subnet_id        = "${module.network.subnet_id_test}"
  public_ip = "${module.publicip.public_ip_address_id}"
}