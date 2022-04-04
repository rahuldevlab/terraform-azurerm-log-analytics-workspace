terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.2"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = ">= 1.2.16"
    }
  }
}



provider "azurerm" {
  alias = "log_analytics_custom_config"
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = !var.soft_delete_enabled
    }
  }

  subscription_id = local.subscription_id
  tenant_id       = local.tenant_id
}
