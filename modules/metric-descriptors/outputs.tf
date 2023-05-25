output "names" {
  description = "List of metric descriptor names"
  value       = google_monitoring_metric_descriptor.self[*].name
}

output "monitored_resource_types" {
  description = "List of metric descriptor monitored resource types"
  value       = google_monitoring_metric_descriptor.self[*].monitored_resource_types
}
