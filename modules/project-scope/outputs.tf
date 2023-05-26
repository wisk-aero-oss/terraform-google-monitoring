

output "metrics_scope_project" {
  description = "Metrics scope project ID"
  value       = local.metrics_scope_project
}
# name not exist - TODO: figure out correct syntax
#output "metrics_scoped_projects" {
#  description = "Metrics scoped projects. All projects that metrics are being collected from"
#  value       = google_monitoring_monitored_project.self[*].name
#}
output "monitored_projects" {
  description = "Monitored projects - Full data for debugging"
  value       = google_monitoring_monitored_project.self
}
output "projects" {
  description = "GCP project settings before any changes"
  value       = data.google_projects.self
}
