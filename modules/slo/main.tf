
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
      #dynamic "availability" {}
      #dynamic "latency" {}
    }
  }
  dynamic "request_based_sli" {
    for_each = each.value.request_based_sli
    content {
      #dynamic "distribution_cut" {}
      #dynamic "good_total_ratio" {}
    }
  }
  dynamic "windows_based_sli" {
    for_each = each.value.windows_based_sli
    content {
      good_bad_metric_filter = windows_based_sli.value.good_bad_metric_filter
      window_period          = windows_based_sli.value.window_period
      #dynamic "good_total_ratio_threshold" { }
      #dynamic "metric_mean_in_range" {}
      #dynamic "metric_sum_in_range" {}
    }
  }
}

## Constructs
#    good_bad_metric_filter =  join(" AND ", [
#      "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\"",
#      "resource.type=\"uptime_url\"",
#    ])
