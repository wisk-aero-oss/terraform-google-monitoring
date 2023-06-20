
variable "audit_configs" {
  description = "List of data audit configuration objects for IAM policy."
  type = list(object({
    service = string
    audit_log_configs = list(object({
      log_type         = string
      exempted_members = optional(list(string))
    }))
  }))
  # allServices - applies to all services (default settings)
  default = []
}

variable "target_id" {
  description = "The id of the resource to manage data access audit logs for."
  type        = string
}
variable "target_type" {
  description = "The type of the resource to manage data access audit logs for (folder, organization, project)."
  type        = string
  default     = "project"
}
