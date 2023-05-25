output "ids" {
  description = "List of dashboard IDs"
  value       = google_monitoring_dashboard.self[*].id
}
