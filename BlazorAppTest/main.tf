provider "azurerm" {
    version = "2.37.0"
    features {}
}

resource "azurerm_resource_group" "tf_test" {
    name = "tfmainrg"
    location = "West Europe"
}

resource "azurerm_container_group" "tfcg_test" {
    name = "blazorapptest"
    location = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name
    ip_address_type     = "public"
    dns_name_label      = "vovadegtyarevblazorapptest"
    os_type             = "Linux"

    container {
        name   = "blazorapptest"
        image  = "vovadegtyarev/blazorapptest"
        cpu    = "1"
        memory = "1"

        ports {
            port     = 80
            protocol = "TCP"
        }
    }
}
