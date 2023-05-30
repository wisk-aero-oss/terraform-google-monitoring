
variable "dashboard_sources_path" {
  description = "Path to process dashboard source files. Example: $${path.module}/dashboards"
  type        = string
}
variable "dashboard_sources_pattern" {
  description = "Dashboard json files pattern"
  type        = string
  default     = "**.json"
}
variable "gcp_project" {
  description = "GCP project to put monitoring in"
  type        = string
}
