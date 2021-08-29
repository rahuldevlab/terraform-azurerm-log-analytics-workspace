terraform {
  required_version = ">= 0.15.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.62.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = ">= 1.2.5"
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
