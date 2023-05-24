
#google_logging_project_bucket_config.self.id
#
#google_logging_organization_sink.self.id
#google_logging_organization_sink.self.writer_identity

output "logging_bucket_config" {
  description = "Full config of the logging bucket config"
  value       = google_logging_project_bucket_config.self
}
