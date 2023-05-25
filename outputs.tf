
#output "output_name" {
#  description = "output value description"
#  value       = # expression or reference to value
#}



# Alert Policies
output "alert_policy_channel_names" {
  description = "Notification channels referenced by alert policies"
  value       = module.alert_policies[*].channel_names
}

# Dashboards
# Groups
output "groups_parents" {
  description = "Root parent groups"
  value       = module.groups[*].parents
}
output "groups_subgroups1" {
  description = "Subgroups - level 1"
  value       = module.groups[*].subgroups1
}
output "groups_subgroups2" {
  description = "Subgroups - level 2"
  value       = module.groups[*].subgroups2
}
output "groups_r_subgroups1" {
  description = "Resource: subgroups level 1"
  value       = module.groups[*].r_subgroups1
}
output "groups_r_subgroups2" {
  description = "Resource: subgroups level 2"
  value       = module.groups[*].r_subgroups2
}

# Log Metrics
# Logging
output "logging_bucket_config" {
  description = "Full config of the logging bucket config"
  value       = module.logging[*].logging_bucket_config
}

# Metric Descriptors
# Notification Channels
output "notification_channel_pagerduty_refs" {
  description = "List of pagerduty service key references"
  value       = module.notification_channels[*].channel_pagerduty_refs
}
output "notification_channel_secret_refs" {
  description = "List of Google secret manager secret references"
  value       = module.notification_channels[*].channel_secret_refs
}
output "notification__channel_pagerduty_integrations" {
  description = "Pagerduty integrations"
  value       = module.notification_channels[*].pagerduty_integrations
  sensitive   = true
}
#output "secrets" {
#  description = "Secrets"
#  value       = module.notification_channels.secrets
#  sensitive   = true
#}

# Project Scope
output "metrics_scope_project" {
  description = "Metrics scope project ID"
  value       = module.project_scope[*].metrics_scope_project
}
output "metric_scope_projects" {
  description = "GCP project settings before any changes"
  value       = module.project_scope[*].projects
}

# Services
# SLOs

# Uptime Checks
output "uptime_check_ids" {
  description = "The IDs of the uptime checks."
  value       = module.uptime_checks[*].ids
}
output "uptime_checks" {
  description = "All uptime checks managed"
  value       = module.uptime_checks[*].uptime_checks
}
