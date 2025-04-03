resource "azurerm_service_plan" "service_plan" {
    name = "service-plan-${ lower(var.project) }-${ var.environment }"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = "B1"
    os_type = "Linux"
}

resource "azurerm_linux_web_app" "web_app_ui_users" {
    name = "web-app-ui-users-${ lower(var.project) }-${ var.environment }"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.service_plan.id
    https_only = true

    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
        WEBSITE_PORT = "80"
    }

    tags = var.tags
}

resource "azurerm_linux_web_app" "web_app_ui_admins" {
    name = "web-app-ui-admins-${ lower(var.project) }-${ var.environment }"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.service_plan.id
    https_only = true

    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
        WEBSITE_PORT = "80"
    }

    tags = var.tags
}

resource "azurerm_linux_web_app" "web_app_api" {
    name = "web-app-api-${ lower(var.project) }-${ var.environment }"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.service_plan.id
    https_only = true

    site_config {
        always_on = true
        application_stack {
            docker_registry_url = "https://index.docker.io"
            docker_image_name = "nginx:latest"
        }
    }

    app_settings = {
        WEBSITE_PORT = "80"
    }

    tags = var.tags
}