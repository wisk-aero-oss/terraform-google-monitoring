output "ids" {
  description = "The IDs of the uptime checks."
  value       = google_monitoring_uptime_check_config.self[*].id
}
