

output "metrics_scope_project" {
  description = "Metrics scope project ID"
  value       = local.metrics_scope_project
}

output "projects" {
  description = "GCP project settings before any changes"
  value       = data.google_projects.self
}
