
variable "gcp_project" {
  description = "GCP project to put monitoring in"
  type        = string
}

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_uptime_check_config
variable "uptime_checks" {
  description = "Uptime check configuration objects"
  type = list(object({
    checker_type = optional(string)
    content_matchers = optional(object({
      content = string
      matcher = optional(string)
      json_path_matcher = optional(object({
        json_path    = string
        json_matcher = optional(string)
      }))
    }))
    display_name = string
    http_check = optional(object({
      accepted_response_status_codes = optional(list(object({
        status_class = optional(string)
        status_value = optional(string) # validate
      })))
      auth_info = optional(object({
        password = string
        username = string
      }))
      body           = optional(string)
      content_type   = optional(string)
      headers        = optional(map(string))
      mark_headers   = optional(bool)
      path           = optional(string)
      port           = optional(string)
      request_method = optional(string)
      use_ssl        = optional(bool)
      validate_ssl   = optional(bool)
    }))
    monitored_resource = optional(object({
      labels = object({
        host       = optional(string)
        project_id = optional(string)
      })
      type = string
    }))
    period = optional(string) # validate
    resource_group = optional(object({
      group_id      = optional(string)
      resource_type = optional(string) # validate
    }))
    # Requires 3. Either global (default) or 3 US regions
    selected_regions = optional(list(string)) # validate
    tcp_check = optional(object({
      port = string
    }))
    timeout = string # validate
  }))
}
