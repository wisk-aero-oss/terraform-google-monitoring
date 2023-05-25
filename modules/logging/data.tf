#data "google_folders" "self" {
#  parent_id = "organizations/${var.organization_id}"
#}
# .folders[].name
# .folders[].display_name
# locals to create list of folder IDs to exclude from organization sink

data "google_organization" "self" {
  domain = var.organization_name
}
