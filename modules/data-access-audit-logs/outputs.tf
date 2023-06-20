
output "folder_id" {
  description = "Folder ID"
  value       = length(data.google_folder.self) > 0 ? data.google_folder.self[0].id : null
}
output "folder_display_name" {
  description = "Folder Display Name"
  value       = length(data.google_folder.self) > 0 ? data.google_folder.self[0].display_name : null
}
output "organization_id" {
  description = "Organization ID"
  value       = length(data.google_organization.self) > 0 ? data.google_organization.self[0].org_id : null
}
