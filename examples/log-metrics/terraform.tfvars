
gcp_project = "company-monitoring"

logging_metrics = [
  {
    description = "HTTP status code 409"
    filter      = "httpRequest.status=409"
    metric_descriptor = {
      description = "HTTP status code 409"
      metric_kind = "DELTA"
      type        = "logging.googleapis.com/user/409s"
      unit        = "1"
      value_type  = "INT64"
    }
    name = "409s"
  },
  {
    filter = "httpRequest.status=502"
    metric_descriptor = {
      metric_kind = "DELTA"
      type        = "logging.googleapis.com/user/502s"
      unit        = "1"
      value_type  = "INT64"
    }
    name = "502s"
  }
]
