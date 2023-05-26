output "dashboards" {
  description = "List of dashboard objects"
  value       = google_monitoring_dashboard.self
}

output "ids" {
  description = "List of dashboard IDs"
  value       = google_monitoring_dashboard.self[*].id
}

#output "dashboard_ids" {
#  description = "List of dashboard IDs"
#  value = google_monitoring_dashboard.self.*.id
#}
