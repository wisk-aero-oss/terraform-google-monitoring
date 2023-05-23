
## Create in notable-monitoring-prod


### Logging Bucket
resource "google_logging_project_bucket_config" "self" {
  bucket_id        = var.logging_bucket
  description      = var.logging_bucket_description
  enable_analytics = true
  location         = "global"
  project          = var.logging_project
  retention_days   = var.logging_bucket_retention_days
}
resource "google_logging_linked_dataset" "self" {
  count       = var.enable_linked_dataset ? 1 : 0
  bucket      = google_logging_project_bucket_config.self.id
  description = var.linked_dataset_description
  link_id     = var.logging_dataset_link_id
  location    = "global"
  #parent =
}

### Organization Sink
resource "google_logging_organization_sink" "self" {
  description      = var.organization_sink_description
  disabled         = var.disable_organization_sink
  include_children = true
  name             = var.organization_sink
  org_id           = data.google_organization.self.org_id
  # Can export to pubsub, cloud storage, or bigquery
  #destination = "storage.googleapis.com/${google_storage_bucket.log-bucket.name}"
  destination = google_logging_project_bucket_config.self.id

  # Log all WARN or higher severity messages relating to instances
  filter = "resource.type = gce_instance AND severity >= WARNING"
  #exclusions =
}

### Permissions
# sink Service Account needs Logs Buckets Writer to log bucket

# Allow each sink's service account to write logs into the audit logs project
resource "google_project_iam_member" "self" {
  project = var.logging_project
  role    = "roles/logging.bucketWriter"
  member  = google_logging_organization_sink.self.writer_identity
}
