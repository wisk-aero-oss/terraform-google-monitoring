
gcp_project = "company-monitoring"


# The metrics referenced by the filter must exist
alert_policies = [
  # Database alerts
  {
    combiner = "OR"
    conditions = [
      {
        condition_threshold = {
          aggregations = [{
            alignment_period     = "60s"
            cross_series_reducer = "REDUCE_SUM"
            group_by_fields = [
              "resource.label.database_id"
            ]
            per_series_aligner = "ALIGN_MEAN"
          }]
          comparison      = "COMPARISON_GT"
          duration        = "60s"
          filter          = "metric.type=\"cloudsql.googleapis.com/database/cpu/utilization\" resource.type=\"cloudsql_database\""
          threshold_value = 0.3
          trigger = {
            count = 1
          }
        }
        display_name = "Cloud SQL Database - CPU utilization by label.database_id [SUM]"
      }
    ]
    display_name = "Cloud SQL CPU Usage > 30%"
    documentation = {
      content = "Doc here"
    }
    enabled = false
    notification_channels = [
      "Testing Monitoring"
    ]
  },
  {
    combiner = "OR"
    conditions = [
      {
        condition_threshold = {
          aggregations = [
            {
              alignment_period   = "60s"
              per_series_aligner = "ALIGN_MEAN"
            }
          ]
          comparison      = "COMPARISON_GT"
          duration        = "60s"
          filter          = "metric.type=\"cloudsql.googleapis.com/database/cpu/utilization\" resource.type=\"cloudsql_database\""
          threshold_value = 0.8
          trigger = {
            count = 1
          }
        }
        display_name = "Cloud SQL Database - CPU utilization"
      }
    ]
    display_name = "Cloud SQL CPU Usage > 80%"
    documentation = {
      content   = "Database load is high, please check out why."
      mime_type = "text/markdown"
    }
    enabled = false
    notification_channels = [
      "Testing Monitoring"
    ]
  },
  # Kubernetes alerts
  {
    alert_strategy = {
      auto_close = "604800s"
    }
    combiner = "OR"
    conditions = [
      {
        condition_threshold = {
          aggregations = [
            {
              alignment_period     = "3600s"
              cross_series_reducer = "REDUCE_PERCENTILE_50"
              per_series_aligner   = "ALIGN_MEAN"
            }
          ]
          comparison      = "COMPARISON_GT"
          duration        = "0s"
          filter          = "resource.type = \"k8s_container\" AND metric.type = \"kubernetes.io/container/cpu/limit_utilization\""
          threshold_value = 0.315
          trigger = {
            count = 1
          }
        }
        display_name = "Kubernetes Container - CPU limit utilization"
      }
    ]
    display_name = "K8 Container - CPU util"
    documentation = {
      content = "Doc here"
    }
    enabled = false
    notification_channels = [
      "Testing Monitoring"
    ]
  }
]
