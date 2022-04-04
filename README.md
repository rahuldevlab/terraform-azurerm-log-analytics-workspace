# Azure Umanis Log Analytics Workspace

[![Build Status](https://dev.azure.com/umanis-consulting/terraform/_apis/build/status/mod_azu_log_analytics_workspace?repoName=mod_azu_log_analytics_workspace&branchName=master)](https://dev.azure.com/umanis-consulting/terraform/_build/latest?definitionId=5&repoName=mod_azu_log_analytics_workspace&branchName=master)[![Unilicence](https://img.shields.io/badge/licence-The%20Unilicence-green)](LICENCE)


Common Azure terraform module to create a Log Analytics workspace

## Naming
Resource naming is based on the Microsoft CAF naming convention best practices. Custom naming is available by setting the parameter `custom_name`. We rely on the official Terraform Azure CAF naming provider to generate resource names when available.

## Location
The resource location is the parent resource group location. To specify a custom location, use the `custom_location` parameter.

## Tags
Tags are inherited from parent resource group. To add resource specific tags, use the `custom_tags`

## Usage
```hcl

module "umanis_tagging" {
  source = "Umanis/tags/azurerm"

  location          = "France Central"
  client            = "XY2"
  project           = "1234"
  budget            = "FE4567"
  rgpd_personal     = true
  rgpd_confidential = false
}

module "umanis_naming" {
  source = "Umanis/naming/azurerm"

  location    = "France Central"
  client      = "XY2"
  project     = "1234"
  area        = 1
  environment = "tst"
}

module "umanis_resource_group" {
  source = "Umanis/resource-group/azurerm"

  tags         = module.umanis_tagging.tags
  location     = "France Central"
  description  = "Test resource group"
  caf_prefixes = module.umanis_naming.resource_group_prefixes
}

module "umanis_resource_log_analytics" {
  source  = "Umanis/log-analytics-workspace/azurerm"
  
  resource_group_name   = module.umanis_resource_group.name
  description           = "Test log analytics workspace"
  caf_prefixes          = module.umanis_naming.resource_prefixes
  instance_index        = 1
}

```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >= 1.2.16 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_index"></a> [instance\_index](#input\_instance\_index) | Resource type index on the resource group. | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the parent resource group name. | `string` | n/a | yes |
| <a name="input_caf_prefixes"></a> [caf\_prefixes](#input\_caf\_prefixes) | Prefixes to use for caf naming. | `list(string)` | `[]` | no |
| <a name="input_custom_location"></a> [custom\_location](#input\_custom\_location) | Specifies a custom location for the resource. | `string` | `""` | no |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | Specifies a custom name for the resource. | `string` | `""` | no |
| <a name="input_custom_tags"></a> [custom\_tags](#input\_custom\_tags) | The custom tags to add on the resource. | `map(string)` | `{}` | no |
| <a name="input_daily_quota_gb"></a> [daily\_quota\_gb](#input\_daily\_quota\_gb) | The workspace daily quota for ingestion in GB. To remove limit, set to -1. | `number` | `1` | no |
| <a name="input_description"></a> [description](#input\_description) | The resource description. | `string` | `""` | no |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | Should the Log Analytics Workflow support ingestion over the Public Internet ? | `bool` | `false` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | Should the Log Analytics Workflow support querying over the Public Internet ? | `bool` | `true` | no |
| <a name="input_name_separator"></a> [name\_separator](#input\_name\_separator) | Name separator | `string` | `"-"` | no |
| <a name="input_reservation_capcity_in_gb_per_day"></a> [reservation\_capcity\_in\_gb\_per\_day](#input\_reservation\_capcity\_in\_gb\_per\_day) | The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000. | `number` | `null` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The workspace data retention in days. Possible values are between 30 and 730. | `number` | `30` | no |
| <a name="input_soft_delete_enabled"></a> [soft\_delete\_enabled](#input\_soft\_delete\_enabled) | Sould the workspace be soft deleted on destroy. | `bool` | `false` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure subscription Id. | `string` | `""` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Azure Tenant Id. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Log Analytics Workspace ID. |
| <a name="output_name"></a> [name](#output\_name) | The Log Analytics Workspace name. |
| <a name="output_primary_shared_key"></a> [primary\_shared\_key](#output\_primary\_shared\_key) | The Primary shared key for the Log Analytics Workspace. |
| <a name="output_secondary_shared_key"></a> [secondary\_shared\_key](#output\_secondary\_shared\_key) | The Secondary shared key for the Log Analytics Workspace. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The Workspace (or Customer) ID for the Log Analytics Workspace. |
<!-- END_TF_DOCS -->

## Related documentation

Terraform Azure log analytics workspace documentation: [https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace)

Terraform Azure CAF Naming documentation: [https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name)