output "ids" {
  description = "The IDs of the uptime checks."
  value       = [for check in google_monitoring_uptime_check_config.self : check.uptime_check_id]
}

output "uptime_checks" {
  description = "All uptime checks managed"
  value       = google_monitoring_uptime_check_config.self
}
