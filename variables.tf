variable "custom_tags" {
  type        = map(string)
  default     = {}
  description = "The custom tags to add on the resource."
}

variable "instance_index" {
  type = number
  validation {
    condition     = var.instance_index > 0 && var.instance_index < 100
    error_message = "Must be a 2 dights number."
  }
  description = "Resource type index on the resource group."
}

variable "custom_location" {
  type        = string
  default     = ""
  description = "Specifies a custom location for the resource."
}

variable "custom_name" {
  type        = string
  default     = ""
  description = "Specifies a custom name for the resource."
}

variable "resource_group_name" {
  type        = string
  description = "Specifies the parent resource group name."
}

variable "description" {
  type        = string
  default     = ""
  description = "The resource description."
}

variable "retention_in_days" {
  type        = number
  default     = 30
  description = "The workspace data retention in days. Possible values are between 30 and 730."
}

variable "daily_quota_gb" {
  type        = number
  default     = 1
  description = "The workspace daily quota for ingestion in GB. To remove limit, set to -1."
}

variable "internet_ingestion_enabled" {
  type        = bool
  default     = false
  description = "Should the Log Analytics Workflow support ingestion over the Public Internet ?"
}

variable "internet_query_enabled" {
  type        = bool
  default     = true
  description = "Should the Log Analytics Workflow support querying over the Public Internet ?"
}

variable "reservation_capcity_in_gb_per_day" {
  type        = number
  default     = null
  description = "The capacity reservation level in GB for this workspace. Must be in increments of 100 between 100 and 5000."
}

variable "soft_delete_enabled" {
  type        = bool
  default     = false
  description = "Sould the workspace be soft deleted on destroy."
}

variable "caf_prefixes" {
  type        = list(string)
  default     = []
  description = "Prefixes to use for caf naming."
}

variable "subscription_id" {
  description = "Azure subscription Id."
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "Azure Tenant Id."
  type        = string
  default     = ""
}
