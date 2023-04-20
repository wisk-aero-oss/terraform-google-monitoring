
variable "gcp_project" {
  description = "GCP project to put monitoring in"
  type        = string
}

variable "slos" {
  description = "List of SLO configuration objects"
  type = list(object({
    basic_sli = optional(object({
      availability = optional(object({
        enabled = optional(bool)
      }))
      latency = optional(object({
        threshold = string
      }))
      location = optional(string)
      method   = optional(string)
      version  = optional(string)
    }))                                # validate
    calendar_period = optional(string) # validate
    display_name    = string
    goal            = string
    request_based_sli = optional(object({
      distribution_cut = optional(object({
        distribution_filter = string
        range = object({
          max = optional(string)
          min = optional(string)
        })
      }))
      good_total_ratio = optional(object({
        bad_service_filter   = optional(string)
        good_service_filter  = optional(string) #map(string) ?
        total_service_filter = optional(string)
      }))
    })) # validate
    rolling_period_days = optional(string)
    service             = string
    slo_id              = optional(string)
    user_labels         = optional(map(string))
    windows_based_sli = optional(object({
      good_bad_metric_filter = optional(string)
      good_total_ratio_threshold = optional(object({
        basic_sli_performance = optional(object({
          availability = optional(object({
            enabled = optional(bool)
          }))
          latency = optional(object({
            threshold = string
          }))
          location = optional(string)
          method   = optional(string)
          version  = optional(string)
        }))
        performance = optional(object({
          distribution_cut = optional(object({
            distribution_filter = string
            range = object({
              max = optional(string)
              min = optional(string)
            })
          }))
          good_total_ratio = optional(object({
            bad_service_filter   = optional(string)
            good_service_filter  = optional(string)
            total_service_filter = optional(string)
          }))
        }))
        threshold = optional(string)
      }))
      metric_mean_in_range = optional(object({
        range = object({
          max = optional(string)
          min = optional(string)
        })
        time_series = string
      }))
      metric_sum_in_range = optional(object({
        range = object({
          max = optional(string)
          min = optional(string)
        })
        time_series = string
      }))
      window_period = optional(string)
    })) # validate
  }))
}
