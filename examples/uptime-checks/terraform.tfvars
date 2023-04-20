
gcp_project = "company-monitoring"

uptime_checks = [{
  checker_type = "STATIC_IP_CHECKERS"
  display_name = "Primary"
  http_check = {
    accepted_response_status_codes = [{
      status_class = "STATUS_CLASS_2XX"
    }]
    path           = "/healthprobe"
    port           = "443"
    request_method = "GET"
    use_ssl        = true
    validate_ssl   = true
  }
  monitored_resource = {
    labels = {
      host = "fqdn"
    }
    type = "uptime_url"
  }
  period = "60s"
  #selected_regions = ["USA"]
  timeout = "5s"
}]
