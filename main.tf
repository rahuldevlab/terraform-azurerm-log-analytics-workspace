locals {
  specific_tags = {
    "description" = var.description
  }

  location      = coalesce(var.custom_location, data.azurerm_resource_group.parent_group.location)
  parent_tags   = { for n, v in data.azurerm_resource_group.parent_group.tags : n => v if n != "description" }
  resource_name = coalesce(var.custom_name, azurecaf_name.self.result)
  tags          = { for n, v in merge(local.parent_tags, local.specific_tags, var.custom_tags) : n => v if v != "" }
}

data "azurerm_resource_group" "parent_group" {
  name = var.resource_group_name
}

resource "azurecaf_name" "self" {
  name          = format("%02d", var.instance_index)
  resource_type = "azurerm_log_analytics_workspace"
  prefixes      = var.caf_prefixes
  suffixes      = []
  use_slug      = true
  clean_input   = true
  separator     = "-"
}


resource "azurerm_log_analytics_workspace" "self" {
  name                              = local.resource_name
  location                          = local.location
  resource_group_name               = data.azurerm_resource_group.parent_group.name
  tags                              = local.tags
  sku                               = "PerGB2018"
  retention_in_days                 = var.retention_in_days
  daily_quota_gb                    = var.daily_quota_gb
  internet_ingestion_enabled        = var.internet_ingestion_enabled
  internet_query_enabled            = var.internet_query_enabled
  reservation_capcity_in_gb_per_day = var.reservation_capcity_in_gb_per_day
}
