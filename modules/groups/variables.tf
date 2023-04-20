
variable "gcp_project" {
  description = "GCP project ID"
  type        = string
}

variable "groups" {
  description = "List of group confiiguration object"
  type = list(object({
    display_name = string
    filter       = string
    is_cluster   = optional(bool)
    parent_name  = optional(string)
  }))
}
