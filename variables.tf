variable "custom_tags" {
  type    = map(string)
  default = {}
}

variable "instance_index" {
  type = number
  validation {
    condition     = var.instance_index > 0 && var.instance_index < 100
    error_message = "Must be a 2 dights number."
  }
}

variable "custom_location" {
  type    = string
  default = ""
}

variable "custom_name" {
  type    = string
  default = ""
}

variable "resource_group_name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "sku" {
  type    = string
  default = "PerGB2018"
}

variable "retention_in_days" {
  type    = number
  default = 30
}

variable "daily_quota_gb" {
  type    = number
  default = 1
}

variable "internet_ingestion_enabled" {
  type    = bool
  default = false
}

variable "internet_query_enabled" {
  type    = bool
  default = true
}

variable "reservation_capcity_in_gb_per_day" {
  type    = number
  default = null
}

variable "soft_delete_enabled" {
  type    = bool
  default = false
}

variable "caf_prefixes" {
  type        = list(string)
  default     = []
  description = "Prefixes to use for caf naming."
}
