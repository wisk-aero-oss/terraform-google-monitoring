
output "ids" {
  description = "List of SLO IDs"
  value       = google_monitoring_slo.self[*].id
}
