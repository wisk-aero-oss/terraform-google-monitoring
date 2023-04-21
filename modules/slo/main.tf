
# Get existing
#   no gcloud
# API
#   https://cloud.google.com/monitoring/api/ref_v3/rest/v3/services.serviceLevelObjectives/list

#data "google_monitoring_app_engine_service" "default" {
#  module_id = "default"
#}

resource "google_monitoring_slo" "appeng_slo" {
  for_each            = { for slo in var.slos : slo.display_name => slo }
  calendar_period     = each.value.calendar_period
  display_name        = each.value.display_name
  goal                = each.value.goal
  project             = var.gcp_project
  rolling_period_days = each.value.rolling_period_days
  service             = each.value.service
  #service = data.google_monitoring_app_engine_service.default.service_id
  slo_id      = each.value.slo_id
  user_labels = each.value.user_labels
  dynamic "basic_sli" {
    for_each = each.value.basic_sli
    content {
      location = basic_sli.value.location
      method   = basic_sli.value.method
      version  = basic_sli.value.version
      dynamic "availability" {
        for_each = basic_sli.value.availability
        content {
          enabled = availability.value.enabled
        }
      }
      dynamic "latency" {
        for_each = basic_sli.value.latency
        content {
          threshold = latency.value.threshold
        }
      }
    }
  }
  dynamic "request_based_sli" {
    for_each = each.value.request_based_sli
    content {
      dynamic "distribution_cut" {
        for_each = request_based_sli.value.distribution_cut
        content {
          distribution_filter = distribution_cut.value.distribution_filter
          dynamic "range" {
            for_each = distribution_cut.value.range
            content {
              min = range.value.min
              max = range.value.max
            }
          }
        }
      }
      dynamic "good_total_ratio" {
        for_each = request_based_sli.value.good_total_ratio
        content {
          bad_service_filter   = good_total_ratio.value.bad_service_filter
          good_service_filter  = good_total_ratio.value.good_service_filter
          total_service_filter = good_total_ratio.value.total_service_filter
        }
      }
    }
  }
  dynamic "windows_based_sli" {
    for_each = each.value.windows_based_sli
    content {
      good_bad_metric_filter = windows_based_sli.value.good_bad_metric_filter
      window_period          = windows_based_sli.value.window_period
      dynamic "good_total_ratio_threshold" {
        for_each = windows_based_sli.value.good_total_ratio_threshold
        content {
          threshold = good_total_ratio_threshold.value.threshold
          dynamic "basic_sli_performance" {
            for_each = good_total_ratio_threshold.value.basic_sli_performance
            content {
              method   = basic_sli_performance.value.method
              location = basic_sli_performance.value.location
              version  = basic_sli_performance.value.version
              dynamic "availability" {
                for_each = basic_sli_performance.value.availability
                content {
                  enabled = availability.value.enabled
                }
              }
              dynamic "latency" {
                for_each = basic_sli_performance.value.latency
                content {
                  threshold = latency.value.threshold
                }
              }
            }
          }
          dynamic "performance" {
            for_each = good_total_ratio_threshold.value.performance
            content {
              dynamic "distribution_cut" {
                for_each = performance.value.distribution_cut
                content {
                  distribution_filter = distribution_cut.value.distribution_filter
                  dynamic "range" {
                    for_each = distribution_cut.value.range
                    content {
                      max = range.value.max
                      min = range.value.min
                    }
                  }
                }
              }
              dynamic "good_total_ratio" {
                for_each = performance.value.good_total_ratio
                content {
                  bad_service_filter   = good_total_ratio.value.bad_service_filter
                  good_service_filter  = good_total_ratio.value.good_service_filter
                  total_service_filter = good_total_ratio.value.total_service_filter
                }
              }
            }
          }
        }
      }
      dynamic "metric_mean_in_range" {
        for_each = windows_based_sli.value.metric_mean_in_range
        content {
          time_series = metric_mean_in_range.value.time_series
          dynamic "range" {
            for_each = metric_mean_in_range.value.range
            content {
              max = range.value.max
              min = range.value.min
            }
          }
        }
      }
      dynamic "metric_sum_in_range" {
        for_each = windows_based_sli.value.metric_sum_in_range
        content {
          time_series = metric_sum_in_range.value.time_series
          dynamic "range" {
            for_each = metric_sum_in_range.value.range
            content {
              max = range.value.max
              min = range.value.min
            }
          }
        }
      }
    }
  }
}

## Constructs
#    good_bad_metric_filter =  join(" AND ", [
#      "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\"",
#      "resource.type=\"uptime_url\"",
#    ])
