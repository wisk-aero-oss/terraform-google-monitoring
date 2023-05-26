

output "metrics_scope_project" {
  description = "Metrics scope project ID"
  value       = local.metrics_scope_project
}
output "metrics_scoped_projects" {
  description = "Metrics scoped projects. All projects that metrics are being collected from"
  value       = [for id in google_monitoring_monitored_project.self[*].id : regex("^.*/([^/]+)$)", id)]
}
output "projects" {
  description = "GCP project settings before any changes"
  value       = data.google_projects.self
}
