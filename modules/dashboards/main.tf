

#https://github.com/newrelic-experimental/nr-terraform-json-dashboard-examples
#https://newrelic.com/blog/how-to-relic/create-nr-dashboards-with-terraform-part-1

## Samples
#https://github.com/GoogleCloudPlatform/monitoring-dashboard-samples
#cloud sql, gcp, gke, google-microservices, kubernetes, logging,
#microservices, networking, storage,


resource "google_monitoring_dashboard" "self" {
  project = var.gcp_project
  #for_each       = fileset("${path.module}/dashboards", "**")
  #dashboard_json = file("${path.module}/dashboards/${each.key}")
  for_each       = fileset(var.dashboard_sources_path, "**")
  dashboard_json = file("${var.dashboard_sources_path}/${each.key}")
}

# make list of maps ()
# need to parse json to get dashboard name
# id: projects/877632929169/dashboards/ab9e4354-25b2-4d0d-90b3-77ab0502f4a2
#output "dashboard_ids" {
#  description = "List of dashboard IDs"
#  value = google_monitoring_dashboard.self.*.id
#}
