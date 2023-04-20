
variable "gcp_project" {
  description = "GCP project to put monitoring in"
  type        = string
}

###---------------------------
### Resource data structures
###---------------------------

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy
variable "alert_policies" {
  description = "Alert policy configuration objects"
  type = list(object({
    alert_strategy = optional(object({
      notification_rate_limit = optional(object({
        period = optional(number)
      }))
      auto_close = optional(string)
    }))
    combiner = string
    conditions = list(object({
      condition_absent = optional(object({
        aggregations = list(object({
          alignment_period     = optional(string)
          cross_series_reducer = optional(string) # validate
          group_by_fields      = optional(string) # ??
          per_series_aligner   = optional(string) # validate
        }))
        duration = string # Valid: minutes in seconds: must be /60
        filter   = optional(string)
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      condition_matched_log = optional(object({
        filter           = optional(string)
        label_extractors = optional(map(string))
      }))
      condition_monitoring_query_language = optional(object({
        duration                = string
        evaluation_missing_data = optional(string) # validate
        query                   = string
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      condition_threshold = optional(object({
        aggregations = optional(list(object({
          alignment_period     = optional(string)       # validate
          cross_series_reducer = optional(string)       # validate
          group_by_fields      = optional(list(string)) # ??
          per_series_aligner   = optional(string)       # validate
        })))
        comparison = string # validate [COMPARISON_GT COMPARISON_GE COMPARISON_LT COMPARISON_LE COMPARISON_EQ COMPARISON_NE]
        denominator_aggregations = optional(object({
          alignment_period     = optional(string)
          cross_series_reducer = optional(string) # validate
          group_by_fields      = optional(string) # ??
          per_series_aligner   = optional(string) # validate
        }))
        denominator_filter      = optional(string)
        duration                = string
        evaluation_missing_data = optional(string) # validate
        filter                  = optional(string)
        threshold_value         = optional(number)
        trigger = optional(object({
          count   = optional(number)
          percent = optional(number)
        }))
      }))
      display_name = string
    }))
    display_name = string
    documentation = object({
      content   = string
      mime_type = optional(string, "text/markdown")
    })
    enabled               = optional(bool, true)
    notification_channels = optional(list(string), [])
    user_labels           = optional(map(string))
  }))
}
