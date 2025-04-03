variable "subscription_id" {
    type = string
    description = "The Azure subscription ID"
}

variable "location" {
    type = string
    description = "The Azure region to deploy resources"
    default = "Central US"
}

variable "project" {
    type = string
    description = "The name of the project"
    default = "proyectoterraform"
}

variable "environment" {
    type = string
    description = "The environment to deploy resources"
    default = "dev"
}

variable "tags" {
    type = map(string)
    description = "A map of tags to apply to all resources"
    default = {
        environment = "development"
        date = "marzo-2025"
        createdBy = "Terraform"
    }
}