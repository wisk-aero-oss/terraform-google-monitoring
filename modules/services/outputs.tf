
output "service_ids" {
  description = "List of service IDs"
  value       = google_monitoring_service.self[*].id
}
output "service_telemetry" {
  description = "List of service telemetry"
  value       = google_monitoring_service.self[*].telemetry
}
output "custom_service_ids" {
  description = "List of custom service IDs"
  value       = google_monitoring_custom_service.self[*].id
}
output "custom_service_telemetry" {
  description = "List of custom service telemetry"
  value       = google_monitoring_custom_service.self[*].telemetry
}
