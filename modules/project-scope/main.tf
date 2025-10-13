

locals {
  # Get metrics scope project (monitor = "scope")
  metrics_scope_project = one([for project in local.projects :
  project.project_id if lookup(project.labels, "monitor", "xxx") == "scope"])
}
# if only org (default), then local.projects instead of local.projects_active
resource "google_monitoring_monitored_project" "self" {
  for_each = { for project in local.projects :
  project.project_id => project if lookup(project.labels, "monitor", "true") == "true" }
  # Monitoring project
  metrics_scope = local.metrics_scope_project
  # Monitored project
  name = each.value.project_id
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_bucket_config
#google_logging_organization_bucket_config
#google_logging_organization_exclusion
#google_logging_organization_sink
#google_logging_metric

# Can do at org, folder, or project level
