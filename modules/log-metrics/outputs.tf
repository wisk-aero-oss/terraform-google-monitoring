
output "ids" {
  description = "List of log metric IDs"
  value       = google_logging_metric.self[*].id
}
