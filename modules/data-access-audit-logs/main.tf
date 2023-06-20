/**
 * # data-access-audit-logs
 *
 * This module can be used to manage data access audit log configuration for a
 * project, folder, or organization.
 *
 */

resource "google_folder_iam_audit_config" "self" {
  for_each = { for service in var.audit_configs : service.service => service
  if var.target_type == "folder" }
  folder  = data.google_folder.self[0].id
  service = each.value.service
  dynamic "audit_log_config" {
    for_each = each.value.audit_log_configs
    content {
      log_type         = audit_log_config.value.log_type
      exempted_members = audit_log_config.value.exempted_members
    }
  }
}
resource "google_organization_iam_audit_config" "self" {
  for_each = { for service in var.audit_configs : service.service => service
  if var.target_type == "organization" }
  org_id  = data.google_organization.self[0].org_id
  service = each.value.service
  dynamic "audit_log_config" {
    for_each = each.value.audit_log_configs
    content {
      log_type         = audit_log_config.value.log_type
      exempted_members = audit_log_config.value.exempted_members
    }
  }
}
resource "google_project_iam_audit_config" "self" {
  for_each = { for service in var.audit_configs : service.service => service
  if var.target_type == "project" }
  project = var.target_id
  service = each.value.service
  dynamic "audit_log_config" {
    for_each = each.value.audit_log_configs
    content {
      log_type         = audit_log_config.value.log_type
      exempted_members = audit_log_config.value.exempted_members
    }
  }
}



## https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project_iam_policy
#data "google_project_iam_policy" "policy" {
#  project = "notable-terraform-testing"
#}
## .policy_data

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam

## Full replace
#resource "google_project_iam_policy" "project" {
#  project     = "your-project-id"
#  policy_data = data.google_iam_policy.admin.policy_data
#}

#output "audit_data" {
#  value = data.google_iam_policy.audit_data.policy_data
#}
