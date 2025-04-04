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


#No nos dejó implementarlo ya que el servicio no está incluido o disponible para el tipo de suscripción que tenemos.

resource "azurerm_cdn_profile" "cdn_profile" {
    name                = "cdn-profile-${lower(var.project)}-${lower(var.environment)}"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    sku                 = "Standard_Verizon"

    tags = var.tags
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
    name                = "cdn-endpoint-${lower(var.project)}-${lower(var.environment)}"
    profile_name        = azurerm_cdn_profile.cdn_profile.name
    resource_group_name = azurerm_resource_group.rg.name

    origin {
        name      = "blob-origin"
        host_name = azurerm_storage_account.storage_account.primary_blob_endpoint 
    }

    is_http_allowed  = true
    is_https_allowed = true

    tags = var.tags
}


