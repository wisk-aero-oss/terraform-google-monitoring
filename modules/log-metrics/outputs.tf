
# No id attribute - TODO: figure out right syntax
#output "ids" {
#  description = "List of log metric IDs"
#  value       = google_logging_metric.self[*].id
#}

output "logging_metrics" {
  description = "All logging metric objects - for debugging"
  value       = google_logging_metric.self
}
