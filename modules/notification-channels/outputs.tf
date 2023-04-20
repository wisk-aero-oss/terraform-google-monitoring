
# Show sensitive values with
#   terraform
#   terraform output -json <output nme>
# nonsensitive(var.mysecret)

output "channel_pagerduty_refs" {
  description = "List of pagerduty service key references"
  value       = local.channel_pagerduty_refs
}
output "channel_secret_refs" {
  description = "List of Google secret manager secret references"
  value       = local.channel_secret_refs
}
output "pagerduty_integrations" {
  description = "Pagerduty integrations"
  value       = data.pagerduty_service_integration.notification_channels
  sensitive   = true
}

output "secrets" {
  description = "Secrets"
  value       = data.google_secret_manager_secret_version_access.notification_channels
  sensitive   = true
}
