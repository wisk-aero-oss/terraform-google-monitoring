

variable "gcp_project" {
  description = "GCP project to put monitoring in"
  type        = string
}

# Get services and recreate (there is 2 - nginx, robot-cerner-copilot)
# no gcloud
# API
#   https://cloud.google.com/monitoring/api/ref_v3/rest/v3/services/list
variable "custom_services" {
  description = "List of Custom Service configuration objects"
  type = list(object({
    display_name = optional(string)
    service_id   = optional(string)
    telemetry = optional(object({
      resource_name = optional(string)
    }))
    user_labels = optional(map(string))
  }))
}

variable "services" {
  description = "List of Service configuration objects"
  type = list(object({
    basic_service = optional(object({
      service_labels = optional(map(string))
      service_type   = optional(string) # validate
    }))
    display_name = string
    service_id   = string
    user_labels  = optional(map(string))
  }))
}
