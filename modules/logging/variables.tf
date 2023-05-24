
# Variables
#variable "disable_organization_sink" {
#  description = "Disable organization sink"
#  type        = bool
#  default     = true
#}
variable "enable_linked_dataset" {
  description = "Enable linked dataset"
  type        = bool
  default     = false
}
variable "linked_dataset_description" {
  description = "Linked dataset description"
  type        = string
  default     = ""
}
variable "logging_bucket" {
  description = "Logging bucket name"
  type        = string
}
variable "logging_bucket_description" {
  description = "Logging bucket description"
  type        = string
  default     = "Organization central logging bucket"
}
variable "logging_bucket_retention_days" {
  description = "Logging bucket retention days"
  type        = number
  default     = 30
}
variable "logging_dataset_link_id" {
  description = "Logging dataset link ID"
  type        = string
  default     = ""
}
variable "logging_project" {
  description = "Ceneral logging project"
  type        = string
}
#variable "organization_name" {
#  description = "Organization name"
#  type        = string
#}
#variable "organization_sink" {
#  description = "Organization sink name"
#  type        = string
#}
#variable "organization_sink_description" {
#  description = "Organization sink description"
#  type        = string
#  default     = "Organization sink"
#}
# This or change to exclude sources list(map(string)) : source_type & display_name
#variable "organization_sink_exclude_folders" {
#  description = "Organization sink list of folder names to exclude"
#  type        = list(string)
#  default     = ["system-gsuite"]
#}
